

import csv

count = 0
bcount = 0

with open("data/chess.txt", "r") as fi, open("data/chess_fixed.txt","w",newline="") as fo:
    focsv = csv.writer(fo)
    focsv.writerow(["pos","date","result","welo","belo","num","datec","resuc","weloc","beloc","edatec","setup","fen","result2","oyrange","bad_len","moves"])


    for line in fi:
        
        count+= 1
        if count % 100000 == 0: print(count, "{:2.3%}".format((float(bcount)/float(count))))
        
        split_line = line.split(" ")
        if split_line[0] == "#": continue
        
        # changing booleans to actual booleans
        for i in range(6,16):
            f = split_line[i][split_line[i].find("_")+1:]
            if f.lower() == "false": f = False
            elif f.lower() == "true": f = True
            else: 
                print("Line", split_line[0], "is invalid in", i, "({})".format(split_line[i]))
            split_line[i] = f
            #print(split_line[i], ": ", f, sep="")
        
        # changing result to actual result
        if split_line[2] == "1-0": split_line[2] = 1
        elif split_line[2] == "1/2-1/2": split_line[2] = 0
        elif split_line[2] == "0-1": split_line[2] = -1
        else: 
            print("Line", split_line[0], "is invalid in 2 ({})".format(split_line[2]))
            continue
        
        valid = not (split_line[6] or split_line[7] or split_line[8] or split_line[9] or split_line[11] or split_line[15])
        
        if not valid:
            #print("{} or {} or {} or {} or {}".format(split_line[6], split_line[7], split_line[8], split_line[9], split_line[11], split_line[15]))
            bcount += 1
            continue
        
        fixed = split_line[0:16]
        fixed.append(" ".join(split_line[17:len(split_line)-1]))
        focsv.writerow(fixed)
        
