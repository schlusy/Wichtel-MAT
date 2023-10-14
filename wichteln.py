import random

def get_random_wichtel_assignment(participants, couples=[]):
    wichtel_participants = participants.copy()

    while True:
        shuffled_participants = random.sample(wichtel_participants, len(participants))

        is_valid = True
        wichtel_assignment = {}

        for i in range(len(participants)):
            gifter = participants[i]
            presentee = shuffled_participants[i]

            if f"{gifter} & {presentee}" in couples or f"{presentee} & {gifter}" in couples:
                is_valid = False
                break

            wichtel_assignment[gifter] = presentee

            if gifter == presentee:
                is_valid = False
                break

        if is_valid:
            return wichtel_assignment

# import participants from input file "participants.txt" 
# one name per row
with open("input/participants.txt", "r") as file:
    participants = [line.strip() for line in file]

# import couples or other exclude combinations from input file "excluding.txt" as
# unwanted combinations (2 names) are noted as "Person1 & Person2"
with open("input/excluding.txt", "r") as file:
    couples = [line.strip() for line in file]

assignment = get_random_wichtel_assignment(participants, couples)

for gifter, presentee in assignment.items():
    print(f"{gifter} beschenkt {presentee}")