module eightb_mult_model (
    `ifdef USE_POWER_PINS
    input  wire vss,
    input  wire vdd,
    `endif
    input  wire a0_not,
    input  wire a0,
    input  wire a1_not,
    input  wire a1,
    input  wire a2_not,
    input  wire a2,
    input  wire a3_not,
    input  wire a3,
    input  wire a4_not,
    input  wire a4,
    input  wire a5_not,
    input  wire a5,
    input  wire a6_not,
    input  wire a6,
    input  wire a7_not,
    input  wire a7,
    input  wire b0_not,
    input  wire b0,
    input  wire b1_not,
    input  wire b1,
    input  wire b2_not,
    input  wire b2,
    input  wire b3_not,
    input  wire b3,
    input  wire b4_not,
    input  wire b4,
    input  wire b5_not,
    input  wire b5,
    input  wire b6_not,
    input  wire b6,
    input  wire b7_not,
    input  wire b7,
    output wire p0,
    output wire p0_not,
    output wire p1,
    output wire p1_not,
    output wire p2,
    output wire p2_not,
    output wire p3,
    output wire p3_not,
    output wire p4,
    output wire p4_not,
    output wire p5,
    output wire p5_not,
    output wire p6,
    output wire p6_not,
    output wire p7,
    output wire p7_not,
    output wire p8,
    output wire p8_not,
    output wire p9,
    output wire p9_not,
    output wire p10,
    output wire p10_not,
    output wire p11,
    output wire p11_not,
    output wire p12,
    output wire p12_not,
    output wire p13,
    output wire p13_not,
    output wire p14,
    output wire p14_not,
    output wire p15,
    output wire p15_not
);
    wire [7:0] a_vec = {a7, a6, a5, a4, a3, a2, a1, a0};
    wire [7:0] b_vec = {b7, b6, b5, b4, b3, b2, b1, b0};

    wire [7:0] a_vec_not = {a7_not, a6_not, a5_not, a4_not, a3_not, a2_not, a1_not, a0_not};
    wire [7:0] b_vec_not = {b7_not, b6_not, b5_not, b4_not, b3_not, b2_not, b1_not, b0_not};

    wire [15:0] product = a_vec * b_vec;

    assign {p15, p14, p13, p12, p11, p10, p9, p8, p7, p6, p5, p4, p3, p2, p1, p0} = product;
    assign {p15_not, p14_not, p13_not, p12_not, p11_not, p10_not, p9_not, p8_not, p7_not, p6_not, p5_not, p4_not, p3_not, p2_not, p1_not, p0_not} = ~product;

    // The explicit complement inputs are present to mirror the reversible logic netlist
    // and allow consistency checks in simulation. They are not otherwise used here.
    wire unused_inputs = ^a_vec_not ^ ^b_vec_not ^ vss ^ vdd;
endmodule
