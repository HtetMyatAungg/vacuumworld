import json

o = json.loads(open('UROP/pipeline/Percepts/event_percepts.json').read())


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
with open("UROP/pipeline/Percepts/World_Model_percepts.json", "w") as f:
    json.dump(result, f, indent=2)


# seen(loc(0,0))

with open("UROP/pipeline/prolog/f1_eval.pl", "w") as f:
    f.write("% ground truth/oracle: 8x8 sweep\n")
    f.write(":- discontiguous seen/1." + "\n" + ":- discontiguous wall/2.\n")
    for coord, data in seen.items():
        f.write(f"seen(loc{coord})." + "\n" )

    for coord, data in seen.items():
        direction = data['walls']
        for dirc in direction:
            f.write(f"wall(loc{coord}, {dirc})." + "\n")
    for coord, data in seen.items():
        dirt = data['dirt']
        if dirt != None:
            f.write(f"seen(dirt(loc{coord}, {dirt}))." + "\n")
    for coord, data in seen.items():
        agent = data['agent']
        if agent != None:
            f.write(f"seen(agent('{agent['id']}', loc{coord}, {agent['colour']}))." + "\n")
