function bold(str) {
  return sprintf("%c[1;30m%s%c[0m\n", 27, str, 27)
}
{ 
  gsub(/^[ \t]+/,"");
  simulator = match($0, /^\s*([^-=][^(]+)/);
  # If the line begins with - or =, it's a header, otherwise it's formatted like:
  # Some Name (Data) (Data)
  if(simulator != 0) {
    # Left align the name and set column width to 20 to align the rest of the lines
    printf "%-20s\t%s\n", substr($0, RSTART, RLENGTH), substr($0, RLENGTH)
  } else {
    # If it's a header, just print it
    printf bold($0)
  }
}
