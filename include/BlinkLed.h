//
// This file is part of the GNU ARM Eclipse distribution.
// Copyright (c) 2014 Liviu Ionescu.
//

#ifndef BLINKLED_H_
#define BLINKLED_H_

#include "stm32f4xx.h"
#include "stm32f4xx_hal.h"

// ----- LED definitions ------------------------------------------------------

#define RED_LED			GPIO_PIN_14
#define GREEN_LED		GPIO_PIN_13

// ----------------------------------------------------------------------------

extern void blink_led_init(void);

// ----------------------------------------------------------------------------

#endif // BLINKLED_H_
