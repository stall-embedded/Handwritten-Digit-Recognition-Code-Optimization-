#include <stdio.h>
#include <stdlib.h>
#include "recognition.h"
#include <math.h>
#include <arm_neon.h>

#define sigmoid(x) (1 / (1 + exp(-x)))

void recognition(float * images, float * network, int depth, int size, int * labels, float * confidences)
{
  int i, j, x, y;
  float *hidden_layers, *temp, **weights, **biases;

  hidden_layers = (float *)malloc(sizeof(float) * size * depth);
  weights = (float **)malloc(sizeof(float *) * (depth + 1));
  biases = (float **)malloc(sizeof(float *) * (depth + 1));

  // Set pointers for weights and biases
  // 1. Input layer
  weights[0] = network;
  biases[0] = weights[0] + size * IMG_SIZE;
  // 2. Hidden layers
  for(i = 1; i < depth; i++)
  {
    weights[i] = network + (size * IMG_SIZE + size) + (size * size + size) * (i-1);
    biases[i] = weights[i] + size * size;
  }

  // 3. Output layer
  weights[depth] = weights[depth - 1] + size * size + size;
  biases[depth] = weights[depth] + DIGIT_COUNT * size;
  // Recognize numbers
  for(i = IMG_COUNT-1; i >=0 ; i--)
    {
	  float * input = images + IMG_SIZE * i;
	  float output[DIGIT_COUNT];

      // From the input layer to the first hidden layer
	  for(x = size-1; x >= 0; x--){
		  float sum = 0;
		  float32x4_t Avec;
		  float32x4_t Bvec;
		  float32x4_t Rvec = vdupq_n_f32(0);
		  for(y = IMG_SIZE-4; y >= 0; y-=4)
		  {
			  Avec = vld1q_f32(&input[y]);
			  Bvec = vld1q_f32(&weights[0][IMG_SIZE*x+y]);
			  Rvec = vmlaq_f32(Rvec, Avec, Bvec);
		  }
		  sum += vgetq_lane_f32(Rvec, 0);
		  sum += vgetq_lane_f32(Rvec, 1);
		  sum += vgetq_lane_f32(Rvec, 2);
		  sum += vgetq_lane_f32(Rvec, 3);
		  sum += biases[0][x];
		  hidden_layers[x] = sigmoid(sum);
	  }


      // Between hidden layers
      for(j = 1; j < depth; j++)
      {
        for(x = size-1; x >= 0; x--)
        {
          float sum = 0;
          float32x4_t Avec;
          float32x4_t Bvec;
          float32x4_t Rvec = vdupq_n_f32(0);
          for(y = size-4; y >= 0; y-=4)
          {
        	  Avec = vld1q_f32(&hidden_layers[size*(j-1)+y]);
        	  Bvec = vld1q_f32(&weights[j][size*x+y]);
        	  Rvec = vmlaq_f32(Rvec, Avec, Bvec);
          }
          sum += vgetq_lane_f32(Rvec, 0);
          sum += vgetq_lane_f32(Rvec, 1);
          sum += vgetq_lane_f32(Rvec, 2);
          sum += vgetq_lane_f32(Rvec, 3);
          sum += biases[j][x];
          hidden_layers[size * j + x] = sigmoid(sum);
        }
      }


      // From the last hidden layer to the output layer
      for(x = DIGIT_COUNT-1; x >= 0; x--)
      {
    	float sum = 0;
    	float32x4_t Avec;
    	float32x4_t Bvec;
    	float32x4_t Rvec = vdupq_n_f32(0);
        for(y = size-4; y >= 0; y-=4)
        {
        	Avec = vld1q_f32(&hidden_layers[size * (depth-1) + y]);
        	Bvec = vld1q_f32(&weights[depth][size * x + y]);
        	Rvec = vmlaq_f32(Rvec, Avec, Bvec);
        }
        sum += vgetq_lane_f32(Rvec, 0);
        sum += vgetq_lane_f32(Rvec, 1);
        sum += vgetq_lane_f32(Rvec, 2);
        sum += vgetq_lane_f32(Rvec, 3);
        sum += biases[depth][x];
        output[x] = sigmoid(sum);
      }

      // Find the answer
      float max = 0;
      int label = 0;
      for(x = 0; x < DIGIT_COUNT; x++)
      {
        if(output[x] > max)
        {
          label = x;
          max = output[x];
        }
      }

      // Store the result
      confidences[i] = max;
      labels[i] = label;
    }

}
