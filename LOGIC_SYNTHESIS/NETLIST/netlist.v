// ---------------------------------------------------------------------------
// Generic Technology-Independent Netlist
// Derived from synthesis results (Cadence Genus)
// All library-specific cell names and drive strengths have been sanitized.
// ---------------------------------------------------------------------------

module seqdet_clean (
    input  wire in_i,
    input  wire clock_i,
    input  wire areset_ni,
    output wire out_o
);

  wire [3:0] state_q;
  wire [3:0] state_d;

  // ------------------------------------------------------------
  // State registers (DFF with async active-low reset)
  // ------------------------------------------------------------

  DFFR_X1 state_reg_0 (.D(state_d[0]), .CK(clock_i), .RN(areset_ni), .Q(state_q[0]));
  DFFR_X1 state_reg_1 (.D(state_d[1]), .CK(clock_i), .RN(areset_ni), .Q(state_q[1]));
  DFFR_X1 state_reg_2 (.D(state_d[2]), .CK(clock_i), .RN(areset_ni), .Q(state_q[2]));
  DFFR_X1 state_reg_3 (.D(state_d[3]), .CK(clock_i), .RN(areset_ni), .Q(state_q[3]));

  // ------------------------------------------------------------
  // Next-state logic (gate-level but generic)
  // ------------------------------------------------------------

  wire n0,n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11,n12,n13,n14,n15,n16,n17,n18,n19,n20,n21,n22,n23,n24,n26,n27,n28,n29,n64;

  // Generic replacement gates
  INV_X1   U1  (.A(n28), .Y(out_o));
  NOR2_X1  U2  (.A(n26), .B(n21), .Y(n28));
  AOI22_X1 U3  (.A(n15), .B(n4), .C(in_i), .D(n24), .Y(n29)); 
  NOR2_X1  U4  (.A(n64), .B(n14), .Y(n22));
  OR2_X1   U5  (.A(state_q[3]), .B(n7), .Y(n18));
  NOR3_X1  U6  (.A(n6), .B(n8), .C(state_q[1]), .Y(n11));
  NAND2_X1 U7  (.A(n5), .B(n3), .Y(n23));
  OAI22_X1 U8  (.A1(state_q[2]), .A2(state_q[0]), .B1(n7), .B2(n3), .Y(n4));
  NOR2_X1  U9  (.A(n7), .B(state_q[2]), .Y(n9));
  NAND2_X1 U10 (.A(n7), .B(state_q[0]), .Y(n12));
  NAND2_X1 U11 (.A(n8), .B(state_q[2]), .Y(n19));
  INV_X1   U12 (.A(n15), .Y(n2));
  INV_X1   U13 (.A(n5),  .Y(n1));
  NAND2_X1 U14 (.A(n3), .B(state_q[0]), .Y(n6));
  NOR2_X1  U15 (.A(in_i), .B(state_q[3]), .Y(n15));
  NOR2_X1  U16 (.A(state_q[1]), .B(state_q[0]), .Y(n5));
  INV_X1   U17 (.A(in_i), .Y(n64));

  // AO / OAI style logic re-mapped generically
  OAI22_X1 U18 (.A1(n2), .A2(n9), .B1(n23), .B2(in_i), .Y(n27));
  NOR2_X1  U19 (.A(n64), .B(n17), .Y(n26));
  OAI21_X1 U20 (.A1(state_q[1]), .A2(n19), .B(n23), .Y(n24));
  NAND2_X1 U21 (.A(in_i), .B(n13), .Y(n21));
  AOI21_X1 U22 (.A1(n19), .A2(n1), .B(n18), .Y(n20));
  AOI31_X1 U23 (.A1(state_q[0]), .A2(n7), .A3(n19), .B(n18), .Y(n17));
  OAI31_X1 U24 (.A1(state_q[2]), .A2(n12), .A3(n15), .B(n10), .Y(n16));
  AOI22_X1 U25 (.A1(n23), .A2(n8), .C1(n5), .C2(n19), .Y(n14));
  AOI21_X1 U26 (.A1(n19), .A2(n12), .B(n11), .Y(n13));
  AOI32_X1 U27 (.A1(n9), .A2(n8), .A3(n0), .B1(n15), .B2(n12), .Y(n10));

  // ------------------------------------------------------------
  // FSM next-state assignments
  // ------------------------------------------------------------

  assign state_d[0] = n29;
  assign state_d[1] = n16;
  assign state_d[2] = n27;
  assign state_d[3] = n22;

endmodule
