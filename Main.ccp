#include <iostream>
#include <cstdlib>
#include <ctime>
#include <string>

using namespace std;

// ================= STRUCTURES =================
struct Hero {
    string name;
    int hp;
    int power;
};

struct Boss {
    string name;
    int hp;
    int power;
};

// ================= FUNCTIONS =================
void displayHeroes(Hero heroes[], int size) {
    cout << "\n--- Heroes ---\n";
    for (int i = 0; i < size; i++) {
        cout << i + 1 << ". "
            << heroes[i].name
            << " | HP: " << heroes[i].hp
            << " | Power: " << heroes[i].power
            << endl;
    }
}

int strongestHero(Hero heroes[], int size) {
    int index = 0;
    for (int i = 1; i < size; i++) {
        if (heroes[i].power > heroes[index].power)
            index = i;
    }
    return index;
}

double averagePower(Hero heroes[], int size) {
    int total = 0;
    for (int i = 0; i < size; i++)
        total += heroes[i].power;

    return (double)total / size;
}

void fightBoss(Hero heroes[], int size, Boss& boss) {

    cout << "\nFINAL BOSS APPEARS \n";
    cout << boss.name
        << " | HP: " << boss.hp
        << " | Power: " << boss.power
        << "\n\n";

    for (int i = 0; i < size && boss.hp > 0; i++) {

        if (heroes[i].hp <= 0)
            continue;

        cout << "====== " << heroes[i].name << " engages! ======\n";

        while (heroes[i].hp > 0 && boss.hp > 0) {

            boss.hp -= heroes[i].power;  //slightly cheated here copyed demo
            cout << "  Hero hits boss for "
                << heroes[i].power << endl;

            if (boss.hp <= 0)
                break;

            heroes[i].hp -= boss.power;  //slightly cheated here copyed demo
            cout << "  Boss hits hero for "
                << boss.power << endl;
        }

        if (heroes[i].hp <= 0)
            cout << "====== " << heroes[i].name << " has fallen! ======\n\n";
    }

    if (boss.hp <= 0)
        cout << "\n The heroes defeated the boss!\n";
    else
        cout << "\n The boss has destroyed all heroes!\n";
}

// ================= MAIN =================
int main() {

    srand((unsigned int)time(0));  //slightly cheated here copyed demo

    const int SIZE = 3;

    // ===== PRESET HERO NAMES =====
    Hero heroes[SIZE] = {
        {"Luffy", rand() % 51 + 100, rand() % 21 + 10},
        {"Naruto",   rand() % 51 + 100, rand() % 21 + 10},
        {"Ichigo",     rand() % 51 + 100, rand() % 21 + 10}
    };

    Boss boss = {
        "Goku",
        rand() % 101 + 250,
        rand() % 26 + 20
    };

    int choice;

    do {
        cout << "\n=== Anime Fight Club ===\n";
        cout << "1. Display Heroes\n";
        cout << "2. Strongest Hero\n";
        cout << "3. Average Power\n";
            cout << "4. Battle Final Boss\n";
            cout << "5. Exit\n";
            cout << "Choice: ";
            cin >> choice;

            if (choice == 1) {
                displayHeroes(heroes, SIZE);
            }
            else if (choice == 2) {
                int index = strongestHero(heroes, SIZE);
                cout << "Strongest hero: "
                    << heroes[index].name << endl;
            }
            else if (choice == 3) {
            cout << "Average Power: "
                << averagePower(heroes, SIZE)
                << endl;
        }
        else if (choice == 4) {
            fightBoss(heroes, SIZE, boss);
        }

    } while (choice != 5);

    cout << "\n===== GAME OVER =====\n";
    cout << "Thanks for playing Anime Fight Club!\n";

    return 0;
}
