module traffic_controller(
    input clk,
    input reset,
    input emergency,

    output reg [2:0] north,
    output reg [2:0] east,
    output reg [2:0] south,
    output reg [2:0] west
);

parameter RED    = 3'b100;
parameter YELLOW = 3'b010;
parameter GREEN  = 3'b001;

// States
parameter N_GREEN  = 3'd0;
parameter N_YELLOW = 3'd1;
parameter E_GREEN  = 3'd2;
parameter E_YELLOW = 3'd3;
parameter S_GREEN  = 3'd4;
parameter S_YELLOW = 3'd5;
parameter W_GREEN  = 3'd6;
parameter W_YELLOW = 3'd7;

reg [2:0] state;
reg [3:0] timer;

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        state <= N_GREEN;
        timer <= 0;
    end
    else if(!emergency)
    begin

        case(state)

        N_GREEN:
        begin
            if(timer==9)
            begin
                state<=N_YELLOW;
                timer<=0;
            end
            else
                timer<=timer+1;
        end

        N_YELLOW:
        begin
            if(timer==2)
            begin
                state<=E_GREEN;
                timer<=0;
            end
            else
                timer<=timer+1;
        end

        E_GREEN:
        begin
            if(timer==9)
            begin
                state<=E_YELLOW;
                timer<=0;
            end
            else
                timer<=timer+1;
        end

        E_YELLOW:
        begin
            if(timer==2)
            begin
                state<=S_GREEN;
                timer<=0;
            end
            else
                timer<=timer+1;
        end

        S_GREEN:
        begin
            if(timer==9)
            begin
                state<=S_YELLOW;
                timer<=0;
            end
            else
                timer<=timer+1;
        end

        S_YELLOW:
        begin
            if(timer==2)
            begin
                state<=W_GREEN;
                timer<=0;
            end
            else
                timer<=timer+1;
        end

        W_GREEN:
        begin
            if(timer==9)
            begin
                state<=W_YELLOW;
                timer<=0;
            end
            else
                timer<=timer+1;
        end

        W_YELLOW:
        begin
            if(timer==2)
            begin
                state<=N_GREEN;
                timer<=0;
            end
            else
                timer<=timer+1;
        end

        default:
        begin
            state<=N_GREEN;
            timer<=0;
        end

        endcase
    end
end

always @(*)
begin

    // Default
    north=RED;
    east=RED;
    south=RED;
    west=RED;

    if(emergency)
    begin
        north=RED;
        east=RED;
        south=RED;
        west=GREEN;
    end

    else
    begin

    case(state)

    N_GREEN:
    begin
        north=GREEN;
    end

    N_YELLOW:
    begin
        north=YELLOW;
    end

    E_GREEN:
    begin
        east=GREEN;
    end

    E_YELLOW:
    begin
        east=YELLOW;
    end

    S_GREEN:
    begin
        south=GREEN;
    end

    S_YELLOW:
    begin
        south=YELLOW;
    end

    W_GREEN:
    begin
        west=GREEN;
    end

    W_YELLOW:
    begin
        west=YELLOW;
    end

    endcase

    end

end

endmodule