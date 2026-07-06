// Traffic Light Controller FSM
 module traffic_light (
    input  clk,
    input  rst,
    input  emergency,
    output reg [1:0] light
);
parameter RED    = 2'b00;// State encoding
parameter GREEN  = 2'b10;
parameter YELLOW = 2'b01;
reg [1:0] state;
reg [3:0] count;
always @(posedge clk or posedge rst) begin
    if (rst) begin
        state <= RED;
        count <= 0;
        light <= RED;
    end
    else if (emergency) begin
        state <= GREEN;
        light <= GREEN;
        count <= 0;
    end
    else begin
        case (state)
            RED: begin
                light <= RED;
                if (count == 4'd5) begin
                    state <= GREEN;
                    count <= 0;
                end else
                    count <= count + 1;
            end
            GREEN: begin
                light <= GREEN;
                if (count == 4'd4) begin
                    state <= YELLOW;
                    count <= 0;
                end else
                    count <= count + 1;
            end
            YELLOW: begin
                light <= YELLOW;
                if (count == 4'd2) begin
                    state <= RED;
                    count <= 0;
                end else
                    count <= count + 1;
            end
            default: state <= RED;
        endcase
    end
end
endmodule