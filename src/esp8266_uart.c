//
// This file is part of the GNU ARM Eclipse distribution.
// Copyright (c) 2014 Liviu Ionescu.
//

#include <stdio.h>
#include "esp8266_uart.h"

// ----------------------------------------------------------------------------

UART_HandleTypeDef UartHandle;
__IO ITStatus UartReady = RESET;

uint8_t aTxBuffer[] = "AT\r\n";
uint8_t aRxBuffer[2];

void uart_init() {
    UartHandle.Instance          = USARTx;

    UartHandle.Init.BaudRate     = 9600;
    UartHandle.Init.WordLength   = UART_WORDLENGTH_8B;
    UartHandle.Init.StopBits     = UART_STOPBITS_1;
    UartHandle.Init.Parity       = UART_PARITY_NONE;
    UartHandle.Init.HwFlowCtl    = UART_HWCONTROL_NONE;
    UartHandle.Init.Mode         = UART_MODE_TX_RX;
    UartHandle.Init.OverSampling = UART_OVERSAMPLING_16;

    if(HAL_UART_Init(&UartHandle) != HAL_OK)
    {
    	puts("Failed to init UART");
    }

    if(HAL_UART_Transmit_IT(&UartHandle, (uint8_t*)aTxBuffer, TXBUFFERSIZE)!= HAL_OK)
    {
    	puts("Failed to tx UART");
    }

    while (UartReady != SET)
    {
    	puts("Waiting for transmission to end");
    }

    UartReady = RESET;

    /*##-4- Put UART peripheral in reception process ###########################*/
    if(HAL_UART_Receive_IT(&UartHandle, (uint8_t *)aRxBuffer, 2) != HAL_OK)
    {
    	puts("Failed to rx UART");
    }

    while (UartReady != SET)
    {
    	puts("Waiting to receive data");
    }

	puts("Response received");
	puts(aRxBuffer);

}


/**
  * @brief  Tx Transfer completed callback
  * @param  UartHandle: UART handle.
  * @note   This example shows a simple way to report end of IT Tx transfer, and
  *         you can add your own implementation.
  * @retval None
  */
void HAL_UART_TxCpltCallback(UART_HandleTypeDef *UartHandle)
{
  /* Set transmission flag: transfer complete*/
  UartReady = SET;
  puts("TX Transmission complete");
}

/**
  * @brief  Rx Transfer completed callback
  * @param  UartHandle: UART handle
  * @note   This example shows a simple way to report end of IT Rx transfer, and
  *         you can add your own implementation.
  * @retval None
  */
void HAL_UART_RxCpltCallback(UART_HandleTypeDef *UartHandle)
{
	  /* Set transmission flag: transfer complete*/
	  UartReady = SET;
	  puts("RX Transmission complete");
}


/**
  * @brief  UART error callbacks
  * @param  UartHandle: UART handle
  * @note   This example shows a simple way to report transfer error, and you can
  *         add your own implementation.
  * @retval None
  */
 void HAL_UART_ErrorCallback(UART_HandleTypeDef *UartHandle)
{
	 puts("Transmission failure");
}

 /**
   * @brief  This function handles UART interrupt request.
   * @param  None
   * @retval None
   * @Note   This function is redefined in "main.h" and related to DMA stream
   *         used for USART data transmission
   */
 void USARTx_IRQHandler(void)
 {
   HAL_UART_IRQHandler(& UartHandle);
 }

 /**
   * @brief UART MSP Initialization
   *        This function configures the hardware resources used in this example:
   *           - Peripheral's clock enable
   *           - Peripheral's GPIO Configuration
   *           - NVIC configuration for UART interrupt request enable
   * @param huart: UART handle pointer
   * @retval None
   */
 void HAL_UART_MspInit(UART_HandleTypeDef *huart)
 {
   GPIO_InitTypeDef  GPIO_InitStruct;

   /*##-1- Enable peripherals and GPIO Clocks #################################*/
   /* Enable GPIO TX/RX clock */
   USARTx_TX_GPIO_CLK_ENABLE();
   USARTx_RX_GPIO_CLK_ENABLE();
   /* Enable USART1 clock */
   USARTx_CLK_ENABLE();

   /*##-2- Configure peripheral GPIO ##########################################*/
   /* UART TX GPIO pin configuration  */
   GPIO_InitStruct.Pin       = USARTx_TX_PIN;
   GPIO_InitStruct.Mode      = GPIO_MODE_AF_PP;
   GPIO_InitStruct.Pull      = GPIO_NOPULL;
   GPIO_InitStruct.Speed     = GPIO_SPEED_FAST;
   GPIO_InitStruct.Alternate = USARTx_TX_AF;

   HAL_GPIO_Init(USARTx_TX_GPIO_PORT, &GPIO_InitStruct);

   /* UART RX GPIO pin configuration  */
   GPIO_InitStruct.Pin = USARTx_RX_PIN;
   GPIO_InitStruct.Alternate = USARTx_RX_AF;

   HAL_GPIO_Init(USARTx_RX_GPIO_PORT, &GPIO_InitStruct);

   /*##-3- Configure the NVIC for UART ########################################*/
   /* NVIC for USART1 */
   HAL_NVIC_SetPriority(USARTx_IRQn, 0, 1);
   HAL_NVIC_EnableIRQ(USARTx_IRQn);
 }

 /**
   * @brief UART MSP De-Initialization
   *        This function frees the hardware resources used in this example:
   *          - Disable the Peripheral's clock
   *          - Revert GPIO and NVIC configuration to their default state
   * @param huart: UART handle pointer
   * @retval None
   */
 void HAL_UART_MspDeInit(UART_HandleTypeDef *huart)
 {
   /*##-1- Reset peripherals ##################################################*/
   USARTx_FORCE_RESET();
   USARTx_RELEASE_RESET();

   /*##-2- Disable peripherals and GPIO Clocks ################################*/
   /* Configure UART Tx as alternate function */
   HAL_GPIO_DeInit(USARTx_TX_GPIO_PORT, USARTx_TX_PIN);
   /* Configure UART Rx as alternate function */
   HAL_GPIO_DeInit(USARTx_RX_GPIO_PORT, USARTx_RX_PIN);

   /*##-3- Disable the NVIC for UART ##########################################*/
   HAL_NVIC_DisableIRQ(USARTx_IRQn);
 }

// ----------------------------------------------------------------------------
