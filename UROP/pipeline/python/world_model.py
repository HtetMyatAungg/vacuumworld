import json

o = json.loads(open('UROP/pipeline/Percepts/event_percepts5x5.json').read())


seen = dict()
for item in o:
    for direction, cell in item['grid'].items():
        if cell is None:
            continue
        coord = tuple(cell['coord'])
        if coord in seen and set(seen[coord]['walls']) != set(cell['walls']):
            print("conflict at", coord, seen[coord]['walls'], "vs", cell['walls'])
        agent = cell['agent'] if cell['agent'] else None
        seen[coord] = {'coord': list(coord), 'walls': cell['walls'], 'dirt': cell['dirt'], 'agent': agent}

result = list(seen.values())
with open("UROP/pipeline/Percepts/World_Model_percepts5x5.json", "w") as f:
    json.dump(result, f, indent=2)


# seen(loc(0,0))

with open("UROP/pipeline/prolog/f1_eval5x5.pl", "w") as f:
    f.write("% ground truth/oracle: 5x5 sweep\n")
    f.write(":- discontiguous oracle_dirt/3.\n" + ":- discontiguous oracle_agent/4.\n" + ":- discontiguous oracle_empty/2.\n" + ":- discontiguous wall/3.\n")
    f.write("grid_size(8).\n")
    for coord, data in seen.items():
        x, y = coord
        f.write(f"grid({x}, {y})." + "\n")

    for coord, data in seen.items():
        x, y = coord
        direction = data['walls']
        for dirc in direction:
            f.write(f"wall({x}, {y}, {dirc})." + "\n")
    for coord, data in seen.items():
        x, y = coord
        dirt = data['dirt']
        if dirt != None:
            f.write(f"oracle_dirt({x}, {y}, {dirt})." + "\n")
    for coord, data in seen.items():
        x, y = coord
        agent = data['agent']
        if agent != None:
            f.write(f"oracle_agent('{agent['id']}', {x}, {y}, {agent['colour']})." + "\n")
    for coord, data in seen.items():
        x, y = coord
        agent = data['agent']
        dirt = data['dirt']
        if agent == None and dirt == None:
            f.write(f"oracle_empty({x}, {y})." + "\n")
