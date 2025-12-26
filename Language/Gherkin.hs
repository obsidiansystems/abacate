-- |
-- Module      :  Language.Gherkin
-- Copyright   :  (c) Marco Túlio Pimenta Gontijo <marcotmarcot@gmail.com> 2012
-- License     :  Apache 2.0 (see the file LICENSE)
--
-- Maintainer  :  Marco Túlio Pimenta Gontijo <marcotmarcot@gmail.com>
-- Stability   :  unstable
-- Portability :  portable
--
-- Gherkin is the language used by the Cucumber system for Behaviour Driven
-- Development.  This package contains a parser to it, based on its BNF with
-- minor changes.  For more information on Cucumber, check <http://cukes.info>.
--
-- According to
-- <https://github.com/cucumber/gherkin/wiki/BNF/cf8696092b0e6841ba0c3cf4e2f0d3c964b9c144>.
module
  Language.Gherkin
  (module Language.Gherkin.Types, parseFile,  parseGherkin)
  where

-- base
import Prelude hiding (readFile)
import Control.Applicative

-- text
import Data.Text
import Data.Text.IO

-- parsec
import Text.Parsec

-- gherkin
import Language.Gherkin.Types
import Language.Gherkin.BNF

-- | Parses a file with 'Gherkin' code.
parseFile :: FilePath -> IO (Either ParseError Gherkin)
parseFile path = parseGherkinWithSource path <$> readFile path

-- | Parses a string with 'Gherkin' code.
parseGherkin :: Text -> Either ParseError Gherkin
parseGherkin = parseGherkinWithSource "parseGherkin"

parseGherkinWithSource :: FilePath -> Text -> Either ParseError Gherkin
parseGherkinWithSource = parse gherkin
