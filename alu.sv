module alu(input logic [2:0] f,input logic [31:0] a,b,  output logic [31:0] y, output logic zero  );

logic [31:0] n1;
assign n1 = a - b;
always_comb 
case (f)
3'b000: assign y = a&b;
3'b001: assign y = a|b;
3'b010: assign y = a+b;
3'b100: assign y = a&~b;
3'b101: assign y = a|~b;
3'b110: assign y = n1;
3'b111: assign y = n1[31];
endcase
assign zero = y ? 0:1;
endmodule
