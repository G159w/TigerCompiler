#! /usr/bin/env python3

'''
                                 ___..........__
           _,...._           _."'_,.++8n.n8898n.`"._        _....._
         .'       `".     _.'_.'" _.98n.68n. `"88n. `'.   ,"       `.
        /        .   `. ,'. "  -'" __.68`""'""=._`+8.  `.'     .     `.
       .       `   .   `.   ,d86+889" 8"""+898n, j8 9 ,"    .          \
      :     '       .,   ,d"'"   _..d88b..__ `"868' .'  . '            :
      :     .      .    _    ,n8""88":8"888."8.  "               '     :
       \     , '  , . .88" ,8P'     ,d8. _   `"8n  `+.      `.   .     '
        `.  .. .     d89' "  _..n689+^'8n88n.._ `+  . `  .  , '      ,'
          `.  . , '  8'    .d88+"    j:""' `886n.    b`.  ' .' .   ."
           '       , .j            ,d'8.         `  ."8.`.   `.  ':
            .    .' n8    ,_      .f A 6.      ,..    `8b, '.   .'_
          .' _    ,88'   :8"8    6'.d`i.`b.   d8"8     688.  ".    `'
        ," .88  .d868  _         ,9:' `8.`8   "'  ` _  8+""      b   `,
      _.  d8P  d'  .d :88.     .8'`j   ;+. "     n888b 8  .     ,88.   .
     `   :68' ,8   88     `.   '   :   l `     .'   `" jb  .`   688b.   ',
    .'  .688  6P   98  =+""`.      `   '       ,-"`+"'+88b 'b.  8689  `   '
   ;  .'"888 .8;  ."+b. : `" ;               .: "' ; ,n  `8 q8, '88:       \
   .   . 898  8:  :    `.`--"8.              d8`--' '   .d'  ;8  898        '
  ,      689  9:  8._       ,68 .        .  :89    ..n88+'   89  689,' `     .
  :     ,88'  88  `+88n  -   . .           .        " _.     6:  `868     '   '
  , '  .68h.  68      `"    . . .        .  . .             ,8'   8P'      .   .
  .      '88  'q.    _.f       .          .  .    '  .._,. .8"   .889        ,
 .'     `898   _8hnd8p'  ,  . ..           . .    ._   `89,8P    j"'  _   `
  \  `   .88, `q9868' ,9      ..           . .  .   8n .8 d8'   +'   n8. ,  '
  ,'    ,+"88n  `"8 .8'     . ..           . .       `8688P"   9'  ,d868'   .  .
  .      . `86b.    " .       .            ..          68'      _.698689;      :
   . '     ,889_.n8. ,  ` .   .___      ___.     .n"  `86n8b._  `8988'b      .,6
    '       q8689'`68.   . `  `:. `.__,' .:'  ,   +   +88 `"688n  `q8 q8.     88
    , .   '  "     `+8 n    .   `:.    .;'   . '    . ,89           "  `q,    `8
   .   .   ,        .    + c  ,   `:.,:"        , "   d8'               d8.    :
    . '  8n           ` , .         ::    . ' "  .  .68h.             .8'`8`.  6
     ,    8b.__. ,  .n8688b., .    .;:._     .___nn898868n.         n868b "`   8
      `.  `6889868n8898886888688898"' "+89n88898868868889'         688898b    .8
       :    q68   `""+8688898P ` " ' . ` '  ' `+688988P"          d8+8P'  `. .d8
       ,     88b.       `+88.     `   ` '     .889"'           ,.88'        .,88
        :    '988b        "88b.._  ,_      . n8p'           .d8"'      '     689
        '.     "888n._,      `"8"+88888n.8,88:`8 .     _ .n88P'   .  `      ;88'
         :8.     "q888.  .            "+888P"  "+888n,8n8'"      .  .     ,d986
         :.`8:     `88986                          `q8"           ,      :688"
         ;.  '8,      "88b .d                        '                  ,889'
         :..   `6n      '8988                                         b.89p
         :. .    '8.      `88b                                        988'
         :. .      8b       `q8.        '                     . '   .d89      '
         . .        `8:       `86n,.       " . ,        , "        ,98P      ,
         .. .         '6n.       +86b.        .      .         _,.n88'     .
           .            `"8b.      'q98n.        ,     .  _..n868688'          .
          ' . .            `"98.     `8868.       .  _.n688868898p"            d
           . .                '88.      "688.       q89888688868"            ,86
         mh '. .                 88.     `8898        " .889"'              .988
'''


import subprocess
import sys
import glob
import os

path_from_curr_dir = sys.argv[0][:-len("testsuite.py")]

# equivalent to an enum type for colors
class bcolors(object):
      GREEN = '\033[92m'
      WARNING = '\033[93m'
      FAIL = '\033[91m'
      ENDC = '\033[0m'
      BLUE = '\033[34m'
      UNDER = '\033[4m'

# executes the sanity test on the file 'path'
def check_sanity(path, expected):
  # run all the tests trough valgrind
  my = subprocess.run(["valgrind", "--error-exitcode=5", sys.argv[1], path],
                      stdout = subprocess.PIPE ,
                      stderr = subprocess.PIPE )
  name = path.split("/")[-1]
  if my.returncode == 5:
    print (bcolors.FAIL + "KO" + bcolors.ENDC + "File: " + name)
    return 0
  else:
    print (bcolors.GREEN + "OK" + bcolors.ENDC + "File: " + name) 
    return 1
  return 0

# executes a test on the file 'path' gives simple oneline output
def basic_test(path, expected):
  ret = 1;
  my = subprocess.run([os.path.abspath(sys.argv[1]), path],
                      stdout = subprocess.PIPE,
                      stderr = subprocess.PIPE)
  name = path.split("/")[-1]
  if (my.returncode == expected):
    print (bcolors.GREEN + "OK " + bcolors.ENDC + "File: " + name)
  else:
    ret = 0
    print (bcolors.FAIL + "KO " + bcolors.ENDC + "File: " + name)
  return ret;

# tests a directory with the corresponding display
def test_dir(directory, function = basic_test):
  d = open(directory + "/info")
  d.readline()
  line = d.readline()
  d.close()
  expected = int(line[-2])
  files = glob.glob(directory + "/*.tig")
  ret = 0
  for name in files:
    ret += function(name, expected)
  if len(files) == 0:
    return [0 , 0]
  return [ret, len(files)]

def display_results(ret):
  if ret[1]:
    color = bcolors.GREEN
    if (ret[0] != ret[1]):
      color = bcolors.FAIL
    print("\nResult: " + color + "{:.2f}".format((ret[0] / ret[1]) * 100) + 
bcolors.ENDC + " % of tests are good. Total:",ret[1], "tests.")
    print(color + """\n
   _
  ( \                ..-----..__
   \.'.        _.--'`  [   '  ' ```'-._
    `. `'-..-'' `    '  ' '   .  ;   ; `-'''-.,__/|/_
      `'-.;..-''`|'  `.  '.    ;     '  `    '   `'  `,
                 \ '   .    ' .     '   ;   .`   . ' 7 \\
                  '.' . '- . \    .`   .`  .   .\     `Y
                    '-.' .   ].  '   ,    '    /'`""';:'
                      /Y   '.] '-._ /    ' _.-'
                      \\'\_   ; (`'.'.'  ."/
                       ' )` /  `.'   .-'.'
                        '\  \).'  .-'--"
                          `. `,_'`
                            `.__) 
""" + bcolors.ENDC)
  else:
    print("No tests were found")

def display_info(path, detail = 0):
  # checking if the fie exists
  if (os.path.isfile(path + "/info")):
    # and opening it
    with open(path + "/info") as f:
      name = path[len(path_from_curr_dir):]
      print("\n" + "-" * (30 - len(name) // 2) + bcolors.UNDER + name.upper() +
            bcolors.ENDC + (30 - (len(name) + 1) // 2) *"-" + "\n")
      if (detail):
        print(f.readline(), end = "")
    return 1
  else:
    return 0

def execute(args):
  # pickup all the directories existing arround the testsuite
  
  dirs = [i for i in glob.glob(path_from_curr_dir + "*") if os.path.isdir(path_from_curr_dir + i)]

  # if you forgot the binary
  if (len(args) == 1):
    print ("usage: './testsuite.py [BIN] [OPTION]' use option -h for a list of options.")
    return 1

  elif ("-h" in args or "--help" in args or (("-c" in args or "--category" in args) and len(args) == 2)):
    print ("usage: './testsuite.py [BIN] [OPTION]'\
\nOptions:\
\n\t-l or --list : displays a list of all test categories with a brief description.\
\n\t-s or --sanity : runs the tests with checking memory leaks or invalid reads\
\n\t-c [category] or --category [category] : launches a specific category")
    return 0

  elif ("-l" in args or "--list" in args):
    for i in dirs:
      display_info(i, 1)
    print("")
    return 0

  elif (len(args) == 2):
    results = [0, 0]
    for i in dirs:
      if (display_info(i)):
        tmp = test_dir(i)
        results[0], results[1] = results[0] + tmp[0], results[1] + tmp[1]
    display_results(results)
    return 0

  elif (len(args) == 3 and ("-s" in args or "--sanity" in args)):
    results = [0, 0]
    # run a check over all of the directories
    for i in dirs:
      if (display_info(i)):
        tmp = test_dir(i, check_sanity)
        results[0], results[1] = results[0] + tmp[0], results[1] + tmp[1]
    display_results(results) 
    return 0

  elif (len(args) == 3 and ("-c" in args or "--category" in args)):
    print("you must give a category to check use ./test.py -l to display the list of categories")
    return 1;

  elif (len(args) >= 4 and ("-c" in args or "--category" in args)):
    k = 0
    # scrapping off the / out of the name
    if args[3][-1] == '/':
      args[3] = args[3][:-1]
    # running trough all the directories
    for i in dirs:
      tmp = i[len(path_from_curr_dir):]
      # if we have a match for the name of the directory launch the tests
      if tmp == args[3]:
        display_info(i)
        if ("-s" in args or "--sanity" in args):
          display_results(test_dir(i, check_sanity))
        else:
          display_results(test_dir(i))
        k = 1

    # if no match error message
    if k == 0:
      print("No such category.\nUse ./test.py -l for a list of categories.")
      return 1
    return 0

  print("Unknown option use -h for a list of options")
  return 1

value = execute(sys.argv)

exit(value)
