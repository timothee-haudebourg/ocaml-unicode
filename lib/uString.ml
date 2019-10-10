module type ENCODING = sig
  val name : string
  val encode : UChar.t -> char list
  val decode : char Seq.t -> UChar.t * char Seq.t
end

module type S = sig
  module Encoding : ENCODING

  type t = string

  val length : t -> int
  val push : UChar.t -> t -> t
  val to_seq : t -> UChar.t Seq.t
end

module Encoded (E: ENCODING) = struct
  module Encoding = E

  type t = string

  let length _ =
    failwith "TODO"

  let push _ _ =
    failwith "TODO"

  let to_seq _ =
    failwith "TODO"
end

module UTF8 = struct
  let name = "UTF-8"

  let encode = failwith "TODO"

  let decode = failwith "TODO"
end

module Utf8String = Encoded (UTF8)
