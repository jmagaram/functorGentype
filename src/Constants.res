// This generates a broken .gen.tsx with a the line...
// export const Broken_T_value: Broken_T_t = ConstantsBS.Broken.Broken.value;
// Notice the double .Broken.Broken.
// This will not load in the browser.
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

// This works. The only difference is the functor return type has been inlined.
// Nothing from here ends up in the .gen.tsx file.
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
