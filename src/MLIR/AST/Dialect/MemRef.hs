-- Copyright 2021 Google LLC
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--      http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

module MLIR.AST.Dialect.MemRef (
    pattern Load
  , pattern Store
  , module MLIR.AST.Dialect.Generated.MemRef
  ) where


import MLIR.AST
import MLIR.AST.Builder
import MLIR.AST.Dialect.Generated.MemRef

pattern Load :: Type -> Name -> [Name] -> Operation
pattern Load ty src idx = Operation
  { opName = "memref.load"
  , opLocation = UnknownLocation
  , opResultTypes = Explicit [ty]
  , opOperands = src : idx
  , opRegions = []
  , opSuccessors = []
  , opAttributes = NoAttrs
  }

pattern Store :: Name -> Name -> [Name] -> Operation
pattern Store src dst idx = Operation
  { opName = "memref.store"
  , opLocation = UnknownLocation
  , opResultTypes = Explicit []
  , opOperands = src : dst : idx
  , opRegions = []
  , opSuccessors = []
  , opAttributes = NoAttrs
  }
