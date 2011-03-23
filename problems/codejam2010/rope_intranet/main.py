
def main(filename):

    with open(filename) as file_obj:
        num_cases = int(file_obj.readline())
        cases = []

        for case in xrange(num_cases):
            num_lines = int(file_obj.readline())
            cases.append(solve_case(case, num_lines, file_obj))

    return "\n".join(cases)

def solve_case(case, num_lines, file_obj):
    lines = []
    inters = 0
    for i in xrange(num_lines):
        a,b = map(int, file_obj.readline().strip().split())
        lines.append((a,b))

        for ai,bi in lines[0:i]:
            if (a > ai and bi > b) or (a < ai and b > bi):
                inters += 1

    return "Case #%d: %d" % (case+1, inters)


if __name__ == '__main__':
    print main("A-large-practice.in")
