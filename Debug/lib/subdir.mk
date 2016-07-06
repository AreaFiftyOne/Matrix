################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
F03_SRCS += \
../lib/catch.f03 

OBJS += \
./lib/catch.o 


# Each subdirectory must supply rules for building sources it contributes
lib/%.o: ../lib/%.f03
	@echo 'Building file: $<'
	@echo 'Invoking: GNU Fortran Compiler'
	gfortran -funderscoring -O0 -g -Wall -c -fmessage-length=0 -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lib/catch.o: ../lib/catch.f03


