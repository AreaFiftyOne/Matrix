################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
F03_SRCS += \
../src/MATRIX.f03 

OBJS += \
./src/MATRIX.o 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.f03
	@echo 'Building file: $<'
	@echo 'Invoking: GNU Fortran Compiler'
	gfortran -funderscoring -O0 -g -Wall -c -fmessage-length=0 -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/MATRIX.o: ../src/MATRIX.f03 lib/catch.o


