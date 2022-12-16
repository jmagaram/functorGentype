module Broken = {
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
}

module Works = {
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
}

@genType
let _ignore = 0
