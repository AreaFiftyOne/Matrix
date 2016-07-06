################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
F03_SRCS += \
../MATRIX.f03 

MOD_SRCS += \
../catch.mod 

OBJS += \
./MATRIX.o \
./catch.o 


# Each subdirectory must supply rules for building sources it contributes
%.o: ../%.f03
	@echo 'Building file: $<'
	@echo 'Invoking: GNU Fortran Compiler'
	gfortran -funderscoring -O0 -g -Wall -c -fmessage-length=0 -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

MATRIX.o: ../MATRIX.f03 catch.o

%.o: ../%.mod
	@echo 'Building file: $<'
	@echo 'Invoking: GNU Fortran Compiler'
	gfortran -funderscoring -O0 -g -Wall -c -fmessage-length=0 -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

catch.o: ../catch.mod


