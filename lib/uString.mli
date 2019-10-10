module type ENCODING = sig
  val name : string

  val encode : UChar.t -> char list

  val decode : char Seq.t -> UChar.t * char Seq.t
end

module type S = sig
  module Encoding : ENCODING

  type t = string

  val length : t -> int
  (** [length str] return the length of the string [str]. *)

  val push : UChar.t -> t -> t
  (** [push c str] create a new string where [c] is added to the end of [str]. *)

  val to_seq : t -> UChar.t Seq.t
  (** [to_seq str] return [str] as a sequence of unicode characters. *)
end

module Encoded (E: ENCODING) : S with module Encoding = E

module UTF8 : ENCODING

module Utf8String : S with module Encoding = UTF8
