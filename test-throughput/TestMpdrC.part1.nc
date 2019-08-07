#include "TestMpdr.h"

#define NUM_TESTS 7
#define TEST_DELAY 10000
#define FINISH_TIME 20000
#define TEST_DURATION 30000

//#define NUM_MSGS 250

#define INIT_TIME 10000

#define MAX_TIMERS 20

module TestMpdrC {
  uses {
    interface Boot;

    interface Timer<TMilli> as InitTimer;
    interface Timer<TMilli> as SendTimer;
    interface Timer<TMilli> as TestTimer;
    interface Timer<TMilli> as FinishTimer;

    interface SplitControl as SerialControl;
    interface SerialLogger;

    interface SplitControl as RadiosControl;

    interface StdControl as MpdrControl;
    interface MpdrRouting;
    interface AMSend as MpdrSend;
    interface Receive as MpdrReceive;
    interface Packet as MpdrPacket;
    interface MpdrStats;
  }
}


implementation {

  bool transmitting = FALSE;

  message_t msgBuffer;
  message_t returnmsgBuffer;
  uint16_t sendCount = 0;
  uint16_t receivedCount = 0;
  uint8_t testCounter = 0;
  uint32_t startTime = 0;
  uint32_t endTime = 0;
	//Identificador
  uint8_t iden = 0;
	
	//Vetor de timers
	uint16_t sendTimer[MAX_TIMERS];
	uint16_t receiveTimer[MAX_TIMERS];
// Init route
