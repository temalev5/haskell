import System.IO( Handle, FilePath, IOMode( ReadMode ),
	openFile, hGetLine, hPutStr, hClose, hIsEOF, stderr )
	
import Control.Monad( when )

dumpFile :: Handle -> FilePath -> Integer -> IO ()

dumpFile handle filename lineNumber = do
	end <- hIsEOF handle
	when ( not end ) $ do
		line <- hGetLine handle
		putStrLn $ show (length line) ++ ": " ++ line
		dumpFile handle filename $ lineNumber + 1
		
main :: IO ()

main = do
	hPutStr stderr "Введите имя файла: "
	filename <- getLine
	handle <- openFile filename ReadMode
	dumpFile handle filename 1
	hClose handle