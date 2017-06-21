
type json_float = [ `Float of int option (* max decimal places *)
                  | `Int ]

type json_list = [ `Array | `Object ]

type json_variant = { json_cons : string option }

type json_field = {
  json_fname  : string;           (* <json name=...> *)
  json_tag_field : string option; (* <json tag_field=...> *)
  json_unwrapped : bool;
}

type json_record = {
  json_keep_nulls : bool; (* { ... } <json keep_nulls> *)
}

type json_repr =
  [ `Bool
  | `Cell
  | `Def
  | `External
  | `Field of json_field
  | `Float of json_float
  | `Int
  | `List of json_list
  | `Nullable
  | `Option
  | `Record of json_record
  | `String
  | `Sum
  | `Tuple
  | `Unit
  | `Variant of json_variant
  | `Wrap ]


val get_json_list : Atd_annot.t -> json_list

val get_json_float : Atd_annot.t -> json_float

val get_json_cons : string -> Atd_annot.t -> string

val get_json_fname : string -> Atd_annot.t -> string

val get_json_tag_field : Atd_annot.t -> string option

val get_json_untyped : Atd_annot.t -> bool

val get_json_record : Atd_annot.t -> json_record
