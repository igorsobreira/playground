
def main(filename):

    file_obj = open(filename)
    num_cases = int(file_obj.readline())
    cases = []

    for i in range(num_cases):
        n = int(file_obj.readline())
        lines = read_next_n_lines(file_obj, n)
        cases.append(solve_case(i+1, lines))

    file_obj.close()
    return "\n".join(cases)

def read_next_n_lines(file_obj, n):
    lines = []
    while n > 0:
        lines.append(map(int, file_obj.readline().rstrip('\n').split()))
        n -= 1
    return lines

def solve_case(case_id, lines):
    inters = 0
    for (i, (a,b)) in enumerate(lines):
        for ai,bi in lines[0:i]:
            if (a > ai and bi > b) or (a < ai and b > bi):
                inters += 1

    return "Case #%d: %d" % (case_id, inters)


if __name__ == '__main__':
    print main("A-small-practice.in")
