//
// This file is part of the GNU ARM Eclipse distribution.
// Copyright (c) 2014 Liviu Ionescu.
//

#include "BlinkLed.h"

// ----------------------------------------------------------------------------

void
blink_led_init()
{
// Enable GPIO Peripheral clock
  RCC->AHB1ENR |= RCC_AHB1ENR_GPIOGEN;

  GPIO_InitTypeDef GPIO_InitStructure;

  // Configure pin in output push/pull mode
  GPIO_InitStructure.Pin = GREEN_LED | RED_LED;
  GPIO_InitStructure.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStructure.Speed = GPIO_SPEED_FAST;
  GPIO_InitStructure.Pull = GPIO_PULLUP;
  HAL_GPIO_Init(GPIOG, &GPIO_InitStructure);


  // Start with led turned on
//  HAL_GPIO_WritePin(GPIOG, GREEN_LED, GPIO_PIN_SET);
  HAL_GPIO_WritePin(GPIOG, RED_LED, GPIO_PIN_SET);
}

// ----------------------------------------------------------------------------
