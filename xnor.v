module norgate(
    input a,
    input b,
    output y
);
assign y=~(a^b);
endmodule

module testbench;
reg a,b;
wire y;
norgate uut(.a(a),.b(b),.y(y));
initial begin
$display("A B | Y");
a=0;b=0;#10; $display("%d %d | %d", a,b,y);
a=0;b=1;#10; $display("%d %d | %d", a,b,y);
a=1;b=0;#10; $display("%d %d | %d", a,b,y);
a=1;b=1;#10; $display("%d %d | %d", a,b,y);
$finish;
end
endmodule