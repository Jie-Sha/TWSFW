type bool =
  | True
  | False

type nat =
  | O
  | S of nat

type ('a, 'b) prod =
  | Pair of 'a * 'b

type comparison =
  | Eq
  | Lt
  | Gt

(** val compOpp : comparison -> comparison **)

let compOpp = function
  | Eq -> Eq
  | Lt -> Gt
  | Gt -> Lt

type positive =
  | XI of positive
  | XO of positive
  | XH

(** val psucc : positive -> positive **)

let rec psucc = function
  | XI x' -> XO (psucc x')
  | XO x' -> XI x'
  | XH -> XO XH

(** val pplus : positive -> positive -> positive **)

let rec pplus x y =
  match x with
    | XI x' ->
        (match y with
           | XI y' -> XO (pplus_carry x' y')
           | XO y' -> XI (pplus x' y')
           | XH -> XO (psucc x'))
    | XO x' ->
        (match y with
           | XI y' -> XI (pplus x' y')
           | XO y' -> XO (pplus x' y')
           | XH -> XI x')
    | XH ->
        (match y with
           | XI y' -> XO (psucc y')
           | XO y' -> XI y'
           | XH -> XO XH)

(** val pplus_carry : positive -> positive -> positive **)

and pplus_carry x y =
  match x with
    | XI x' ->
        (match y with
           | XI y' -> XI (pplus_carry x' y')
           | XO y' -> XO (pplus_carry x' y')
           | XH -> XI (psucc x'))
    | XO x' ->
        (match y with
           | XI y' -> XO (pplus_carry x' y')
           | XO y' -> XI (pplus x' y')
           | XH -> XO (psucc x'))
    | XH ->
        (match y with
           | XI y' -> XI (psucc y')
           | XO y' -> XO (psucc y')
           | XH -> XI XH)

(** val pdouble_minus_one : positive -> positive **)

let rec pdouble_minus_one = function
  | XI x' -> XI (XO x')
  | XO x' -> XI (pdouble_minus_one x')
  | XH -> XH

type positive_mask =
  | IsNul
  | IsPos of positive
  | IsNeg

(** val pdouble_plus_one_mask : positive_mask -> positive_mask **)

let pdouble_plus_one_mask = function
  | IsNul -> IsPos XH
  | IsPos p -> IsPos (XI p)
  | IsNeg -> IsNeg

(** val pdouble_mask : positive_mask -> positive_mask **)

let pdouble_mask = function
  | IsNul -> IsNul
  | IsPos p -> IsPos (XO p)
  | IsNeg -> IsNeg

(** val pdouble_minus_two : positive -> positive_mask **)

let pdouble_minus_two = function
  | XI x' -> IsPos (XO (XO x'))
  | XO x' -> IsPos (XO (pdouble_minus_one x'))
  | XH -> IsNul

(** val pminus_mask : positive -> positive -> positive_mask **)

let rec pminus_mask x y =
  match x with
    | XI x' ->
        (match y with
           | XI y' -> pdouble_mask (pminus_mask x' y')
           | XO y' -> pdouble_plus_one_mask (pminus_mask x' y')
           | XH -> IsPos (XO x'))
    | XO x' ->
        (match y with
           | XI y' -> pdouble_plus_one_mask (pminus_mask_carry x' y')
           | XO y' -> pdouble_mask (pminus_mask x' y')
           | XH -> IsPos (pdouble_minus_one x'))
    | XH -> (match y with
               | XI p -> IsNeg
               | XO p -> IsNeg
               | XH -> IsNul)

(** val pminus_mask_carry : positive -> positive -> positive_mask **)

and pminus_mask_carry x y =
  match x with
    | XI x' ->
        (match y with
           | XI y' -> pdouble_plus_one_mask (pminus_mask_carry x' y')
           | XO y' -> pdouble_mask (pminus_mask x' y')
           | XH -> IsPos (pdouble_minus_one x'))
    | XO x' ->
        (match y with
           | XI y' -> pdouble_mask (pminus_mask_carry x' y')
           | XO y' -> pdouble_plus_one_mask (pminus_mask_carry x' y')
           | XH -> pdouble_minus_two x')
    | XH -> IsNeg

(** val pminus : positive -> positive -> positive **)

let pminus x y =
  match pminus_mask x y with
    | IsNul -> XH
    | IsPos z0 -> z0
    | IsNeg -> XH

(** val pmult : positive -> positive -> positive **)

let rec pmult x y =
  match x with
    | XI x' -> pplus y (XO (pmult x' y))
    | XO x' -> XO (pmult x' y)
    | XH -> y

(** val pcompare : positive -> positive -> comparison -> comparison **)

let rec pcompare x y r =
  match x with
    | XI x' ->
        (match y with
           | XI y' -> pcompare x' y' r
           | XO y' -> pcompare x' y' Gt
           | XH -> Gt)
    | XO x' ->
        (match y with
           | XI y' -> pcompare x' y' Lt
           | XO y' -> pcompare x' y' r
           | XH -> Gt)
    | XH -> (match y with
               | XI y' -> Lt
               | XO y' -> Lt
               | XH -> r)

(** val eqb : bool -> bool -> bool **)

let eqb b1 b2 =
  match b1 with
    | True -> (match b2 with
                 | True -> True
                 | False -> False)
    | False -> (match b2 with
                  | True -> False
                  | False -> True)

(** val negb : bool -> bool **)

let negb = function
  | True -> False
  | False -> True

type 'a list =
  | Nil
  | Cons of 'a * 'a list

(** val app : 'a1 list -> 'a1 list -> 'a1 list **)

let app l m =
  let rec app0 l0 m0 =
    match l0 with
      | Nil -> m0
      | Cons (a, l1) -> Cons (a, (app0 l1 m0))
  in app0 l m

type z =
  | Z0
  | Zpos of positive
  | Zneg of positive

(** val zplus : z -> z -> z **)

let zplus x y =
  match x with
    | Z0 -> y
    | Zpos x' ->
        let x0 = Zpos x' in
        (match y with
           | Z0 -> x0
           | Zpos y' -> Zpos (pplus x' y')
           | Zneg y' ->
               (match pcompare x' y' Eq with
                  | Eq -> Z0
                  | Lt -> Zneg (pminus y' x')
                  | Gt -> Zpos (pminus x' y')))
    | Zneg x' ->
        let x0 = Zneg x' in
        (match y with
           | Z0 -> x0
           | Zpos y' ->
               (match pcompare x' y' Eq with
                  | Eq -> Z0
                  | Lt -> Zpos (pminus y' x')
                  | Gt -> Zneg (pminus x' y'))
           | Zneg y' -> Zneg (pplus x' y'))

(** val zopp : z -> z **)

let zopp = function
  | Z0 -> Z0
  | Zpos x0 -> Zneg x0
  | Zneg x0 -> Zpos x0

(** val zminus : z -> z -> z **)

let zminus m n =
  zplus m (zopp n)

(** val zmult : z -> z -> z **)

let zmult x y =
  match x with
    | Z0 -> Z0
    | Zpos x' ->
        (match y with
           | Z0 -> Z0
           | Zpos y' -> Zpos (pmult x' y')
           | Zneg y' -> Zneg (pmult x' y'))
    | Zneg x' ->
        (match y with
           | Z0 -> Z0
           | Zpos y' -> Zneg (pmult x' y')
           | Zneg y' -> Zpos (pmult x' y'))

(** val zcompare : z -> z -> comparison **)

let zcompare x y =
  match x with
    | Z0 -> (match y with
               | Z0 -> Eq
               | Zpos y' -> Lt
               | Zneg y' -> Gt)
    | Zpos x' ->
        (match y with
           | Z0 -> Gt
           | Zpos y' -> pcompare x' y' Eq
           | Zneg y' -> Gt)
    | Zneg x' ->
        (match y with
           | Z0 -> Lt
           | Zpos y' -> Lt
           | Zneg y' -> compOpp (pcompare x' y' Eq))

(** val zle_bool : z -> z -> bool **)

let zle_bool x y =
  match zcompare x y with
    | Eq -> True
    | Lt -> True
    | Gt -> False

(** val zge_bool : z -> z -> bool **)

let zge_bool x y =
  match zcompare x y with
    | Eq -> True
    | Lt -> False
    | Gt -> True

(** val zgt_bool : z -> z -> bool **)

let zgt_bool x y =
  match zcompare x y with
    | Eq -> False
    | Lt -> False
    | Gt -> True

(** val zeq_bool : z -> z -> bool **)

let zeq_bool x y =
  match zcompare x y with
    | Eq -> True
    | Lt -> False
    | Gt -> False

(** val zdiv_eucl_POS : positive -> z -> (z, z) prod **)

let rec zdiv_eucl_POS a b =
  match a with
    | XI a' ->
        let Pair (q, r) = zdiv_eucl_POS a' b in
        let r' = zplus (zmult (Zpos (XO XH)) r) (Zpos XH) in
        (match zgt_bool b r' with
           | True -> Pair ((zmult (Zpos (XO XH)) q), r')
           | False -> Pair ((zplus (zmult (Zpos (XO XH)) q) (Zpos XH)),
               (zminus r' b)))
    | XO a' ->
        let Pair (q, r) = zdiv_eucl_POS a' b in
        let r' = zmult (Zpos (XO XH)) r in
        (match zgt_bool b r' with
           | True -> Pair ((zmult (Zpos (XO XH)) q), r')
           | False -> Pair ((zplus (zmult (Zpos (XO XH)) q) (Zpos XH)),
               (zminus r' b)))
    | XH ->
        (match zge_bool b (Zpos (XO XH)) with
           | True -> Pair (Z0, (Zpos XH))
           | False -> Pair ((Zpos XH), Z0))

(** val zdiv_eucl : z -> z -> (z, z) prod **)

let zdiv_eucl a b =
  match a with
    | Z0 -> Pair (Z0, Z0)
    | Zpos a' ->
        (match b with
           | Z0 -> Pair (Z0, Z0)
           | Zpos p -> zdiv_eucl_POS a' b
           | Zneg b' ->
               let Pair (q, r) = zdiv_eucl_POS a' (Zpos b') in
               (match r with
                  | Z0 -> Pair ((zopp q), Z0)
                  | Zpos p -> Pair ((zopp (zplus q (Zpos XH))), (zplus b r))
                  | Zneg p -> Pair ((zopp (zplus q (Zpos XH))), (zplus b r))))
    | Zneg a' ->
        (match b with
           | Z0 -> Pair (Z0, Z0)
           | Zpos p ->
               let Pair (q, r) = zdiv_eucl_POS a' b in
               (match r with
                  | Z0 -> Pair ((zopp q), Z0)
                  | Zpos p0 -> Pair ((zopp (zplus q (Zpos XH))),
                      (zminus b r))
                  | Zneg p0 -> Pair ((zopp (zplus q (Zpos XH))),
                      (zminus b r)))
           | Zneg b' ->
               let Pair (q, r) = zdiv_eucl_POS a' (Zpos b') in
               Pair (q, (zopp r)))

type bit = bool

type byte =
  (((((((bit, bit) prod, bit) prod, bit) prod, bit) prod, bit) prod, bit)
  prod, bit) prod

(** val bit0 : z -> bit **)

let bit0 z0 =
  negb (zeq_bool z0 Z0)

(** val z_to_byte : z -> byte **)

let z_to_byte z0 =
  let Pair (q1, r1) = zdiv_eucl z0 (Zpos (XO XH)) in
  let Pair (q2, r2) = zdiv_eucl q1 (Zpos (XO XH)) in
  let Pair (q3, r3) = zdiv_eucl q2 (Zpos (XO XH)) in
  let Pair (q4, r4) = zdiv_eucl q3 (Zpos (XO XH)) in
  let Pair (q5, r5) = zdiv_eucl q4 (Zpos (XO XH)) in
  let Pair (q6, r6) = zdiv_eucl q5 (Zpos (XO XH)) in
  let Pair (q7, r7) = zdiv_eucl q6 (Zpos (XO XH)) in
  let Pair (q8, r8) = zdiv_eucl q7 (Zpos (XO XH)) in
  Pair ((Pair ((Pair ((Pair ((Pair ((Pair ((Pair ((bit0 r8), 
  (bit0 r7))), (bit0 r6))), (bit0 r5))), (bit0 r4))), 
  (bit0 r3))), (bit0 r2))), (bit0 r1))

type ip_address = (((byte, byte) prod, byte) prod, byte) prod

(** val ip : z -> z -> z -> z -> ip_address **)

let ip z1 z2 z3 z4 =
  Pair ((Pair ((Pair ((z_to_byte z1), (z_to_byte z2))), 
    (z_to_byte z3))), (z_to_byte z4))

type ip_range = { ip_base : ip_address; ip_mask : ip_address }

(** val ip_base : ip_range -> ip_address **)

let ip_base x = x.ip_base

(** val ip_mask : ip_range -> ip_address **)

let ip_mask x = x.ip_mask

(** val byte_mask_bool : byte -> byte -> byte -> byte -> bool **)

let byte_mask_bool a1 m1 a2 m2 =
  let Pair (p, a18) = a1 in
  let Pair (p0, a17) = p in
  let Pair (p1, a16) = p0 in
  let Pair (p2, a15) = p1 in
  let Pair (p3, a14) = p2 in
  let Pair (p4, a13) = p3 in
  let Pair (a11, a12) = p4 in
  let Pair (p5, m18) = m1 in
  let Pair (p6, m17) = p5 in
  let Pair (p7, m16) = p6 in
  let Pair (p8, m15) = p7 in
  let Pair (p9, m14) = p8 in
  let Pair (p10, m13) = p9 in
  let Pair (m11, m12) = p10 in
  let Pair (p11, a28) = a2 in
  let Pair (p12, a27) = p11 in
  let Pair (p13, a26) = p12 in
  let Pair (p14, a25) = p13 in
  let Pair (p15, a24) = p14 in
  let Pair (p16, a23) = p15 in
  let Pair (a21, a22) = p16 in
  let Pair (p17, m28) = m2 in
  let Pair (p18, m27) = p17 in
  let Pair (p19, m26) = p18 in
  let Pair (p20, m25) = p19 in
  let Pair (p21, m24) = p20 in
  let Pair (p22, m23) = p21 in
  let Pair (m21, m22) = p22 in
  (match match m11 with
           | True -> True
           | False ->
               (match m21 with
                  | True -> True
                  | False -> eqb a11 a21) with
     | True ->
         (match match m12 with
                  | True -> True
                  | False ->
                      (match m22 with
                         | True -> True
                         | False -> eqb a12 a22) with
            | True ->
                (match match m13 with
                         | True -> True
                         | False ->
                             (match m23 with
                                | True -> True
                                | False -> eqb a13 a23) with
                   | True ->
                       (match match m14 with
                                | True -> True
                                | False ->
                                    (match m24 with
                                       | True -> True
                                       | False -> eqb a14 a24) with
                          | True ->
                              (match match m15 with
                                       | True -> True
                                       | False ->
                                           (match m25 with
                                              | True -> True
                                              | False -> eqb a15 a25) with
                                 | True ->
                                     (match match m16 with
                                              | True -> True
                                              | False ->
                                                  (
                                                  match m26 with
                                                    | 
                                                  True -> True
                                                    | 
                                                  False -> eqb a16 a26) with
                                        | True ->
                                            (match 
                                             match m17 with
                                               | True -> True
                                               | False ->
                                                  (match m27 with
                                                    | 
                                                  True -> True
                                                    | 
                                                  False -> eqb a17 a27) with
                                               | True ->
                                                  (match m18 with
                                                    | 
                                                  True -> True
                                                    | 
                                                  False ->
                                                  (match m28 with
                                                    | 
                                                  True -> True
                                                    | 
                                                  False -> eqb a18 a28))
                                               | False -> False)
                                        | False -> False)
                                 | False -> False)
                          | False -> False)
                   | False -> False)
            | False -> False)
     | False -> False)

(** val ip_address_bool : ip_range -> ip_range -> bool **)

let ip_address_bool ip1 ip2 =
  let { ip_base = ipb1; ip_mask = ipm1 } = ip1 in
  let Pair (p, a14) = ipb1 in
  let Pair (p0, a13) = p in
  let Pair (a11, a12) = p0 in
  let Pair (p1, m14) = ipm1 in
  let Pair (p2, m13) = p1 in
  let Pair (m11, m12) = p2 in
  let { ip_base = ipb2; ip_mask = ipm2 } = ip2 in
  let Pair (p3, a24) = ipb2 in
  let Pair (p4, a23) = p3 in
  let Pair (a21, a22) = p4 in
  let Pair (p5, m24) = ipm2 in
  let Pair (p6, m23) = p5 in
  let Pair (m21, m22) = p6 in
  (match byte_mask_bool a11 m11 a21 m21 with
     | True ->
         (match byte_mask_bool a12 m12 a22 m22 with
            | True ->
                (match byte_mask_bool a13 m13 a23 m23 with
                   | True -> byte_mask_bool a14 m14 a24 m24
                   | False -> False)
            | False -> False)
     | False -> False)

type action =
  | Permit
  | Deny

type protocol =
  | Udp
  | Tcp

type port_number = z

type pn_interval = (port_number, port_number) prod

type access_rule = { r_action : action; r_protocol : 
                     protocol; r_source_ip : ip_range;
                     r_source_pn : pn_interval; r_dest_ip : 
                     ip_range; r_dest_pn : pn_interval }

(** val r_action : access_rule -> action **)

let r_action x = x.r_action

(** val r_protocol : access_rule -> protocol **)

let r_protocol x = x.r_protocol

(** val r_source_ip : access_rule -> ip_range **)

let r_source_ip x = x.r_source_ip

(** val r_source_pn : access_rule -> pn_interval **)

let r_source_pn x = x.r_source_pn

(** val r_dest_ip : access_rule -> ip_range **)

let r_dest_ip x = x.r_dest_ip

(** val r_dest_pn : access_rule -> pn_interval **)

let r_dest_pn x = x.r_dest_pn

type rule_set = access_rule list

(** val action_bool : action -> action -> bool **)

let action_bool a1 a2 =
  match a1 with
    | Permit -> (match a2 with
                   | Permit -> True
                   | Deny -> False)
    | Deny -> (match a2 with
                 | Permit -> False
                 | Deny -> True)

(** val protocol_bool : protocol -> protocol -> bool **)

let protocol_bool pt1 pt2 =
  match pt1 with
    | Udp -> (match pt2 with
                | Udp -> True
                | Tcp -> False)
    | Tcp -> (match pt2 with
                | Udp -> False
                | Tcp -> True)

(** val pn_bool : pn_interval -> pn_interval -> bool **)

let pn_bool pn1 pn2 =
  let Pair (x1, y1) = pn1 in
  let Pair (x2, y2) = pn2 in
  (match match zle_bool x1 y1 with
           | True -> zle_bool x2 y2
           | False -> False with
     | True ->
         (match zle_bool x1 y2 with
            | True -> zle_bool x2 y1
            | False -> False)
     | False -> False)

(** val conflict_check : access_rule -> access_rule -> bool **)

let conflict_check r1 r2 =
  let { r_action = a1; r_protocol = pt1; r_source_ip = sip1; r_source_pn =
    spn1; r_dest_ip = dip1; r_dest_pn = dpn1 } = r1
  in
  let { r_action = a2; r_protocol = pt2; r_source_ip = sip2; r_source_pn =
    spn2; r_dest_ip = dip2; r_dest_pn = dpn2 } = r2
  in
  (match action_bool a1 a2 with
     | True -> False
     | False ->
         (match protocol_bool pt1 pt2 with
            | True ->
                (match ip_address_bool sip1 sip2 with
                   | True ->
                       (match pn_bool spn1 spn2 with
                          | True ->
                              (match ip_address_bool dip1 dip2 with
                                 | True -> pn_bool dpn1 dpn2
                                 | False -> False)
                          | False -> False)
                   | False -> False)
            | False -> False))

(** val rrs_conflicts : nat -> nat -> access_rule -> rule_set -> (nat, nat)
                        prod list **)

let rec rrs_conflicts i n r = function
  | Nil -> Nil
  | Cons (rh, rt) ->
      (match conflict_check r rh with
         | True -> Cons ((Pair (i, n)), (rrs_conflicts i (S n) r rt))
         | False -> rrs_conflicts i (S n) r rt)

(** val conflicts_aux : nat -> rule_set -> (nat, nat) prod list **)

let rec conflicts_aux n = function
  | Nil -> Nil
  | Cons (r, rs') ->
      app (rrs_conflicts n (S n) r rs') (conflicts_aux (S n) rs')

(** val find_conflicts : rule_set -> (nat, nat) prod list **)

let find_conflicts x =
  conflicts_aux O x

let rules = []

let ccallcheck s_ip s_mask s_port d_ip d_mask d_port proto url = 
	let ls = find_conflicts ({r_action=Permit;r_protocol=proto;r_source_ip={ip_base=s_ip;ip_mask=s_mask};r_source_pn={6,7};r_dest_i={ip_base=d_ip;ip_mask=d_mask};r_dest_pn={6,7}}#rules) in
		if isEmpty ls then 0 else 1

let _ = Callback.register "check function" ccallcheck
