#define _GNU_SOURCE
#include <pthread.h>
#include <signal.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>
#include <sys/shm.h>
#include <sys/mman.h>
#include <sys/ipc.h>
#include <stdint.h>
#include "cacheutils.h"

size_t start = 0;
size_t keystate = 0;
size_t kpause = 0;
void flushandreload(void* addr)
{

  size_t time = rdtsc_begin();
  maccess(addr);
  size_t delta = rdtsc_end() - time;
  flush(addr);
   //printf("Critical section ends \n");
  if (delta < 200)
  {
    // if (kpause > 10)
    // {
      printf("Cache Hit %10lu after %10lu cycles, t=%10lu us\n", delta, kpause, (time-start)/2600);
      keystate = (keystate+1) % 2;
////    kpause = 0;
  }
  // else
  //   kpause++;
}

int main(int argc, char** argv)
{
  char* secret =  "Magic0Magic1Magic2Magic3Magic4Magic5Magic6Magic7Magic8Magic9";

//"MagicMagi2Magi3Magi4Magi5Magi6Magi7Magi8Magi9Magi0";

 // malicious_x = (secret); /* default for malicious_x */


  char* name ;//= argv[1];
  char* offsetp ;//= argv[2];
//  if (argc != 3)
  //  return 1;
  unsigned int offset = 64;
  //!sscanf(offsetp,"%x",&offset);
//  int fd = open(name,O_RDONLY);
  //if (fd < 3)
    //return 2;
  unsigned char* addr = secret;
  //(unsigned char*)mmap(0, 64*1024*1024, PROT_READ, MAP_SHARED, fd, 0);
//  if (addr == (void*)-1)
  //  return 3;
//  printf("Cache Hit\n");
start = rdtsc();

  while(1)
  {
    flushandreload(addr + offset);
    sched_yield();
  }
  return 0;
}
