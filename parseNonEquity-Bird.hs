--
newtype Parser a = Parser (String -> [(a,String)])
--
apply :: Parser a -> String -> [(a,String)]
apply (Parser p) s = p s
--
parse :: Parser a -> String -> a
parse p = fst . head . apply p
--
instance Monad Parser where
  return x = Parser (\s -> [(x,s)])
  p >>= q = Parser (\s -> [(y,s'')
                          | (x,s') <- apply p s,
                            (y,s'') <- apply (q x) s'])
--
getc :: Parser Char
getc = Parser f
       where f []     = []
             f (c:cs) =[(c,cs)]
--
sat :: (Char -> Bool) -> Parser Char
sat p = do {c <- getc; guard (p c); return c}
--
fail = Parser (\s -> [])
--
guard :: Parser ()
guard True  = return ()
guard False = fail
-- looks for character x
char :: Char -> Parser ()
char x = do {c <- sat (==x); return ()}
-- looks for string
string :: String -> Parser ()
string []     = return ()
string (x:xs) = do {char x; string xs; return ()}
--
(<|>) :: Parser a -> Parser a -> Parser a
p <|> q = Parser f
          where f s = let ps = apply p s in
                      if null ps then apply q s
                      else ps
