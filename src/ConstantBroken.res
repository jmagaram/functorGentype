// This is the same code that is inside the Constants.Broken module.
// But the .gen.tsx is fine.

module type Config = {
  type t
  let constant: t
}

module type T = {
  type t
  @genType
  let value: t
}

module Make = (P: Config): (T with type t := P.t) => {
  let value = P.constant
}

@genType
let _ignore = 0
