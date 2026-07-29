`timescale 1ns/1ps

module traffic_tb;

reg clk;
reg reset;
reg emergency;

wire [2:0] north;
wire [2:0] east;
wire [2:0] south;
wire [2:0] west;

traffic_controller uut(

.clk(clk),
.reset(reset),
.emergency(emergency),

.north(north),
.east(east),
.south(south),
.west(west)

);

always #5 clk=~clk;

initial
begin

clk=0;
reset=1;
emergency=0;

#20;
reset=0;
#250;
emergency=1;

#80;

emergency=0;

#250;

$finish;

end

initial
begin
$monitor("Time=%0t Emergency=%b N=%b E=%b S=%b W=%b",
$time,emergency,north,east,south,west);
end

endmodule