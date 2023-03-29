INSTRUCTIONS FOR RUNNING LOGISIM:

Project consists of following modules,


1. allot_doctor - boolean function has been implemented which takes as input feedback from the doctor's availability status and the incoming query requests, 
and then outputs a suitable signal to be transmitted back.

2. doctor_availabilitystatus - module consists of 2 sub-module namely timer and decoder. This module is responsible for returning the current status, as well as feedback from the runways. 
This is done using a combination of flip-flops.

3. Timer - timer module consists of a counter and flip-flops which store the current availabiltiy status of the doctors. Depnding on whether the doctor is vacant/occupied , the
corresponding output signal is generated.

4. Counter- a 4-bit counter implemented using jk flip flops.

To start the logisim simulation,
$ logisim input.circ
opens up the simulator.

Inside the simulator, press Ctrl+R to reset the simulation, and then Ctrl+K to start the clock used for the simulation.

To give the inputs,
1. First turn on enable.
2. The incoming query represented as binary number AB
example, query numbered 2 is represented as 10
3. For sendiing in the inputs, turn on the enable.

OUTPUT:
1. If the required doctor is available, the corresponding doctor bit will become set (either doctorA or B)
2. However, if the doctor is not available, the wait signal bit becomes set.

INSTRUCTIONS FOR RUNNING VERILOG:

Files contained have been names as indicated in the project specification.

The files can be run by running the command "iverilog <filename>.v <filename>_tb.v"
then after compilation, use the command "vvp a.out" to view the output.

The output displays the time of the incoming query, the type of incoming query and the doctor allotted.