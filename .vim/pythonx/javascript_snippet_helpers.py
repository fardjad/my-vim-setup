import re

def normalize(s, beginning):
  if (s == ''):
    return []

  # parenthesis must be there to include delimiters when splitting a string
  # with this regex
  upperCaseRegex = re.compile(r'([A-Z][a-z]+)')

  chunks = upperCaseRegex.split(s)
  # take care of empty strings
  chunks = filter(None, chunks)

  if beginning:
    chunks[0] = chunks[0].lower()
  else:
    chunks[0] = chunks[0].title()
	
  for i in range(1, len(chunks)):
    chunks[i] = chunks[i].title()

  return chunks

def formatVariableName(path):
  lastPart = path.split('/')[-1]
    
  delimiterRegex = re.compile(r'[_\-]')
  lastPartChunks = delimiterRegex.split(lastPart)

  normalizedChunks = []
  for i in range(0, len(lastPartChunks)):
    normalizedChunks += normalize(lastPartChunks[i], i == 0)

  return ''.join(normalizedChunks)

