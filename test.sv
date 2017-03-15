module test();
logic clk,reset;
logic [31:0] a,b,yexpected;
logic [2:0] f;
logic [31:0]y;
logic zero;
logic zeroexpected;
logic [31:0] vectornum, errors;
logic [104:0] testvectors [10000:0];
 
alu dut(f,a,b,y,zero);
always
begin
clk=1; #3; clk=0; #3;
end
initial
begin
$readmemh("alu.tv",testvectors);
vectornum = 0; errors=0;
reset=1; #2 reset=0;
end
always @(posedge clk)
begin
#1; {f,a,b,yexpected,zeroexpected} = testvectors[vectornum];
end
 
always @(negedge clk)
 
if (~reset) begin
 

if (y !== yexpected) begin
$display("Error: Inputs = %b ", f);
$display("Error: Inputs = %h ", a);
$display("Error: Inputs = %h ", b);
 
$display("Output(Y) = %h (%h expected)",y,yexpected);
errors = errors + 1;
end
vectornum = vectornum + 1;
if (vectornum === 32'h15) begin
$display("%d tests completed with %d errors",
vectornum, errors);
$finish;
end
end
endmodule
