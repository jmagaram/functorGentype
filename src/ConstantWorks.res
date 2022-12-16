module type Config = {
  type t
  let constant: t
}

module Make = (P: Config): {
  type t
  @genType
  let value: t
} => {
  type t = P.t
  let value = P.constant
}

@genType
let _ignore = 0
