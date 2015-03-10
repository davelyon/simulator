# Find a device by name

{
  gsub(/^[ \t]+/,"");
  if($0 ~ simname) {
    match($0,/\([^)]+/);
    printf "%-20s\n", substr($0, RSTART+1, RLENGTH-1)
  }
}
