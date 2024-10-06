module bka8(
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output cout 
);

wire [7:0] p;
wire [7:0] g;

assign p = a ^ b;
assign g = a & b;

/// upwards

assign p_7_6 = p[7] & p[6];
assign g_7_6 = g[7] | (g[6] & p[7]);

assign p_5_4 = p[5] & p[4];
assign g_5_4 = g[5] | (g[4] & p[5]);

assign p_3_2 = p[3] & p[2];
assign g_3_2 = g[3] | (g[2] & p[3]);

assign p_1_0 = p[1] & p[0];
assign g_1_0 = g[1] | (g[0] & p[1]);

/// lvl 2

assign p_7_4 = p_7_6 & p_5_4;
assign g_7_4 = g_7_6 | (g_5_4 & p_7_6);

assign p_3_0 = p_3_2 & p_1_0;
assign g_3_0 = g_3_2 | (g_1_0 & p_3_2);

// lvl 3

assign p_7_0 = p_7_4 & p_3_0;
assign g_7_0 = g_7_4 | (g_3_0 & p_7_4);


/// Downward

assign p_2_0 = p[2] & p_1_0;
assign g_2_0 = g[2] | (g_1_0 & p[2]);

assign p_4_0 = p[4] & p_3_0;
assign g_4_0 = g[4] | (g_3_0 & p[4]);

assign p_5_0 = p_5_4 & p_4_0;
assign g_5_0 = g_5_4 | (g_4_0 & p_5_4);

assign p_6_0 = p[6] & p_5_0;
assign g_6_0 = g[6] | (g_5_0 & p[6]);

/// sum

assign s[0] = p[0];
assign s[1] = p[1] ^ g[0];
assign s[2] = p[2] ^ g_1_0;
assign s[3] = p[3] ^ g_2_0;
assign s[4] = p[4] ^ g_3_0;
assign s[5] = p[5] ^ g_4_0;
assign s[6] = p[6] ^ g_5_0;
assign s[7] = p[7] ^ g_6_0;

assign cout = g_7_0;

endmodule