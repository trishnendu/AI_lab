#include<iostream>
#include<algorithm>
#include<cmath>
#include<vector>
#include<set>
#include<map>

using namespace std;


int hash_state(vector<int> l){
    unsigned int hash_val = 0;
    for(int i = 0; i < l.size(); i++)
        hash_val = hash_val * 10 + l[i]; 
    return hash_val;
}


vector<int> unhash_state(unsigned int a){
    vector<int> state;
    while(a){
        state.insert(state.begin(), a % 10);
        a /= 10;
    }
    return state;
}


void print_container(vector<int> l){
    for(int i = 0; i < l.size(); i++)
        cout << l[i] << " ";
    cout << endl;
}


void print_container(vector<unsigned int> l){
    for(int i = 0; i < l.size(); i++)
        cout << l[i] << " ";
    cout << endl;
}


void print_container(map<unsigned int, unsigned int> l){
    for(map<unsigned int, unsigned int>::iterator itr = l.begin(); itr != l.end(); itr++)
        cout << itr->first << ", " << itr->second << endl;
    cout << endl;
}


bool sort_by_sec(const pair<unsigned int, int> &a, const pair<unsigned int, int> &b){
    return (a.second > b.second);
}


class prod_sys{
    vector<int> start, goal;

    public: 
        vector<int> state;
        vector<int> rules;
        map<unsigned int, unsigned int> sol_graph;

        prod_sys(){
            start = {2, 8, 3, 1, 6, 4, 7, 9, 5};
            goal = {1, 2, 3, 8, 9, 4, 7, 6, 5};
            rules = {-3, 3, -1, 1};     // up, down, left, right
            sol_graph[hash_state(start)] = hash_state(start);
        }

        vector<int> get_start(){
            return start;
        }

        bool goal_achived(vector<int> l){
            return (hash_state(goal) == hash_state(l));
        }

        int hm(vector<int> l){
            int val = 0;
            for(int i = 0; i < l.size(); i++){
                if(l[i] != 9){
                    int j = find(goal.begin(), goal.end(), l[i]) - goal.begin();
                    val += abs(i/3 - j/3) + abs(i%3 - j%3);
                }
            }
            return val;
        }

        int ht(vector<int> l){
            int val = 0;
            for(int i = 0; i < l.size(); i++){
                if(l[i] != 9 && l[i] != goal[i]) val += 1;
            }
            return val;
        }

        int hh(vector<int> l){
            return abs(hash_state(l) - hash_state(goal));
        }
};


int dfs_solver(prod_sys &puzzle){
    set<unsigned int> closed_set;
    vector<unsigned int> open_list;
    map<unsigned int, int> next_rule;               //for a particular state what is the next rule yet to be applied 
    vector<int> cur_state(puzzle.get_start());
    open_list.push_back(hash_state(cur_state));

    while(true){ 
        if(puzzle.goal_achived(cur_state))    return hash_state(cur_state);
        unsigned cur_state_hash = hash_state(cur_state);
        if(next_rule.find(cur_state_hash) == next_rule.end())       //check if any rule hasbeen triggered from node
            next_rule.insert(make_pair(cur_state_hash, 0));

        int index_blank = 0;
        while(cur_state[index_blank] != 9)  index_blank++;          //find the blank spot
        
        for( ; next_rule[cur_state_hash] < puzzle.rules.size(); next_rule[cur_state_hash]++){       //find next valid rule
            int new_pos = index_blank + puzzle.rules[next_rule[cur_state_hash]];
            if(new_pos >= 0 && new_pos <= 8){
                int tmp;
                vector<int> tmp_state(cur_state);                   //apply the rule
                tmp = tmp_state[new_pos];
                tmp_state[new_pos] = 9;
                tmp_state[index_blank] = tmp;
                unsigned int tmp_hashval = hash_state(tmp_state);
                if(closed_set.find(tmp_hashval) == closed_set.end()){           //check if new child is already visited
                    open_list.erase(remove(open_list.begin(), open_list.end(), tmp_hashval), open_list.end());  //if it is in open list bring at front
                    open_list.push_back(tmp_hashval);
                    if(puzzle.sol_graph[tmp_hashval] == 0){                     //check if it's parent has been set or not
                        puzzle.sol_graph[tmp_hashval] = cur_state_hash;
                    }
                    break;                                            //break if the rule hasbeen triggerd              
                }
            }
        }
        next_rule[cur_state_hash]++;
        if(next_rule[cur_state_hash] >= puzzle.rules.size()){       //if all rules is exhausted for a node, mark as closed
            closed_set.insert(cur_state_hash);
            open_list.erase(find(open_list.begin(), open_list.end(), cur_state_hash));
        }
        if(open_list.size() == 0){
            return 0;
        }   
        else    cur_state = unhash_state(open_list.back()); 
    }
}


int bfs_solver(prod_sys &puzzle){
    set<unsigned int> closed_set;
    vector<unsigned int> open_list;
    map<unsigned int, int> next_rule; 
    
    vector<int> cur_state(puzzle.get_start());
    open_list.push_back(hash_state(cur_state));

    while(true){ 
        if(puzzle.goal_achived(cur_state))    return hash_state(cur_state);
        unsigned cur_state_hash = hash_state(cur_state);
        if(next_rule.find(cur_state_hash) == next_rule.end())
            next_rule.insert(make_pair(cur_state_hash, 0));

        int index_blank = 0;
        while(cur_state[index_blank] != 9)  index_blank++;
        
        for( ; next_rule[cur_state_hash] < puzzle.rules.size(); next_rule[cur_state_hash]++){
            int new_pos = index_blank + puzzle.rules[next_rule[cur_state_hash]];
            if(new_pos >= 0 && new_pos <= 8){
                int tmp;
                vector<int> tmp_state(cur_state);
                tmp = tmp_state[new_pos];
                tmp_state[new_pos] = 9;
                tmp_state[index_blank] = tmp;
                unsigned int tmp_hashval = hash_state(tmp_state);
                if(closed_set.find(tmp_hashval) == closed_set.end()){
                    if(find(open_list.begin(), open_list.end(), tmp_hashval) == open_list.end())    //if not in open list just add
                        open_list.insert(open_list.begin(), tmp_hashval);
                    if(puzzle.sol_graph[tmp_hashval] == 0){
                        puzzle.sol_graph[tmp_hashval] = cur_state_hash;
                    }
                    break;
                }
            }
        }
        next_rule[cur_state_hash]++;
        if(next_rule[cur_state_hash] >= puzzle.rules.size()){
            closed_set.insert(cur_state_hash);
            open_list.erase(find(open_list.begin(), open_list.end(), cur_state_hash));
        }
        if(open_list.size() == 0){
            return 0;
        }   
        else    cur_state = unhash_state(open_list.back()); 
    }
}


int iter_deepening_solver(prod_sys &puzzle){
    set<unsigned int> main_closed_set;
    vector<int> cur_state;
    int D = 0;
    while(++D){
        set<unsigned int> closed_set;
        vector<unsigned int> open_list;
        vector<int> node_depth;             // stores information about depth at which a node is generated
        map<unsigned int, int> next_rule;
        int cur_depth = 1;      //assuming start node has depth of 1
        cur_state = puzzle.get_start();
        open_list.push_back(hash_state(cur_state));
        node_depth.push_back(cur_depth);
        
        while(true){ 
            if(puzzle.goal_achived(cur_state))     return hash_state(cur_state);
            unsigned cur_state_hash = hash_state(cur_state);
            if(next_rule.find(cur_state_hash) == next_rule.end())
                next_rule.insert(make_pair(cur_state_hash, 0));

            int index_blank = 0;
            while(cur_state[index_blank] != 9)  index_blank++;
            
            for( ; next_rule[cur_state_hash] < puzzle.rules.size(); next_rule[cur_state_hash]++){
                int new_pos = index_blank + puzzle.rules[next_rule[cur_state_hash]];
                if(new_pos >= 0 && new_pos <= 8){
                    int tmp;
                    vector<int> tmp_state(cur_state);
                    tmp = tmp_state[new_pos];
                    tmp_state[new_pos] = 9;
                    tmp_state[index_blank] = tmp;
                    unsigned int tmp_hashval = hash_state(tmp_state);
                    if((closed_set.find(tmp_hashval) == closed_set.end()) && (cur_depth < D)){      //if depth limit is reached don't generate more children
                        if(find(open_list.begin(), open_list.end(), tmp_hashval) != open_list.end()){
                            ptrdiff_t pos = find(open_list.begin(), open_list.end(), tmp_hashval) - open_list.begin();
                            open_list.erase(open_list.begin() + pos);
                            node_depth.erase(node_depth.begin() + pos);
                        }
                        open_list.push_back(tmp_hashval);
                        node_depth.push_back(cur_depth + 1);
                        if(puzzle.sol_graph[tmp_hashval] == 0){
                            puzzle.sol_graph[tmp_hashval] = cur_state_hash;
                        }
                        break;
                    }
                }
            }
            next_rule[cur_state_hash]++;
            if(next_rule[cur_state_hash] >= puzzle.rules.size()){
                closed_set.insert(cur_state_hash);
                ptrdiff_t pos = find(open_list.begin(), open_list.end(), cur_state_hash) - open_list.begin();
                open_list.erase(open_list.begin() + pos);
                node_depth.erase(node_depth.begin() + pos);
            }
            if(open_list.size() == 0){
                break;
            }   
            else{
                cur_state = unhash_state(open_list.back());
                cur_depth = node_depth.back();
            }
        }
        int prev_size = main_closed_set.size();
        main_closed_set.insert(closed_set.begin(), closed_set.end());
        if(prev_size == main_closed_set.size()) return 0; 
    }
}


int hill_climb_solver(prod_sys &puzzle){
    set<unsigned int> closed_set;
    vector<unsigned int> open_list;
    //map<unsigned int, int> next_rule; 
    vector<int> cur_state(puzzle.get_start());
    open_list.push_back(hash_state(cur_state));

    while(true){ 
        if(puzzle.goal_achived(cur_state))    return hash_state(cur_state);
        unsigned cur_state_hash = hash_state(cur_state);
        /*if(next_rule.find(cur_state_hash) == next_rule.end())
            next_rule.insert(make_pair(cur_state_hash, 0));*/
        int index_blank = 0;
        while(cur_state[index_blank] != 9)  index_blank++;
        vector<pair<unsigned int, int> > children;
        /*for( ; next_rule[cur_state_hash] < puzzle.rules.size(); next_rule[cur_state_hash]++){   // generate all possible children 
            int new_pos = index_blank + puzzle.rules[next_rule[cur_state_hash]];*/
        for(int rule = 0; rule < puzzle.rules.size(); rule++){
            int new_pos = index_blank + puzzle.rules[rule];
            if(new_pos >= 0 && new_pos <= 8){
                int tmp;
                vector<int> tmp_state(cur_state);
                tmp = tmp_state[new_pos];
                tmp_state[new_pos] = 9;
                tmp_state[index_blank] = tmp;
                unsigned int tmp_hashval = hash_state(tmp_state);
                if(closed_set.find(tmp_hashval) == closed_set.end()){
                    open_list.erase(remove(open_list.begin(), open_list.end(), tmp_hashval), open_list.end());
                    children.push_back(make_pair(tmp_hashval, puzzle.hm(tmp_state)));
                    if(puzzle.sol_graph[tmp_hashval] == 0){
                        puzzle.sol_graph[tmp_hashval] = cur_state_hash;
                    }
                }
            }
            sort(children.begin(), children.end(), sort_by_sec);    //sort the children and add to front
            for(int i = 0; i < children.size(); i++)
                open_list.push_back(children[i].first);
        }
        closed_set.insert(cur_state_hash);
        open_list.erase(find(open_list.begin(), open_list.end(), cur_state_hash));
        if(open_list.size() == 0){
            return 0;
        }   
        else    cur_state = unhash_state(open_list.back());         //choose the child with minimum heuristic
    }
}


int best_fit_solver(prod_sys &puzzle){
    set<unsigned int> closed_set;
    multiset<pair<int, unsigned int> > open_orderedset;         //maintain an ordered set as we need sorted container
    //map<unsigned int, int> next_rule; 
    vector<int> cur_state(puzzle.get_start());
    open_orderedset.insert(make_pair(puzzle.hm(cur_state), hash_state(cur_state)));

    while(true){ 
        if(puzzle.goal_achived(cur_state))    return hash_state(cur_state);
        unsigned cur_state_hash = hash_state(cur_state);
        /*if(next_rule.find(cur_state_hash) == next_rule.end())
            next_rule.insert(make_pair(cur_state_hash, 0));*/
        int index_blank = 0;
        while(cur_state[index_blank] != 9)  index_blank++;
        /*for( ; next_rule[cur_state_hash] < puzzle.rules.size(); next_rule[cur_state_hash]++){
            int new_pos = index_blank + puzzle.rules[next_rule[cur_state_hash]];*/
        for(int rule = 0; rule < puzzle.rules.size(); rule++){
            int new_pos = index_blank + puzzle.rules[rule];
            if(new_pos >= 0 && new_pos <= 8){
                int tmp;
                vector<int> tmp_state(cur_state);
                tmp = tmp_state[new_pos];
                tmp_state[new_pos] = 9;
                tmp_state[index_blank] = tmp;
                unsigned int tmp_hashval = hash_state(tmp_state);
                if(closed_set.find(tmp_hashval) == closed_set.end()){
                    open_orderedset.insert(make_pair(puzzle.hm(tmp_state), tmp_hashval));
                    if(puzzle.sol_graph[tmp_hashval] == 0){
                        puzzle.sol_graph[tmp_hashval] = cur_state_hash;
                    }
                }
            }
        }
        closed_set.insert(cur_state_hash);
        open_orderedset.erase(find(open_orderedset.begin(), open_orderedset.end(), make_pair(puzzle.hm(cur_state), cur_state_hash)));
        if(open_orderedset.size() == 0){
            return 0;
        }   
        else    cur_state = unhash_state((*open_orderedset.begin()).second);
    }
}


int astar_solver(prod_sys &puzzle){
    set<unsigned int> closed_set;
    multiset<pair<int, pair<unsigned int, int> > > open_orderedset;     // maintain orderedset with extra information f(n)
    //map<unsigned int, int> next_rule; 
    vector<int> cur_state(puzzle.get_start());
    int cur_f = 0;
    open_orderedset.insert(make_pair(cur_f + puzzle.hm(cur_state), make_pair(hash_state(cur_state), cur_f)));

    while(true){ 
        if(puzzle.goal_achived(cur_state))    return hash_state(cur_state);
        unsigned cur_state_hash = hash_state(cur_state);
        /*if(next_rule.find(cur_state_hash) == next_rule.end())
            next_rule.insert(make_pair(cur_state_hash, 0));*/
        int index_blank = 0;
        while(cur_state[index_blank] != 9)  index_blank++;
        /*for( ; next_rule[cur_state_hash] < puzzle.rules.size(); next_rule[cur_state_hash]++){
            int new_pos = index_blank + puzzle.rules[next_rule[cur_state_hash]];*/
        for(int rule = 0; rule < puzzle.rules.size(); rule++){
            int new_pos = index_blank + puzzle.rules[rule];
            if(new_pos >= 0 && new_pos <= 8){
                int tmp;
                vector<int> tmp_state(cur_state);
                tmp = tmp_state[new_pos];
                tmp_state[new_pos] = 9;
                tmp_state[index_blank] = tmp;
                unsigned int tmp_hashval = hash_state(tmp_state);
                if(closed_set.find(tmp_hashval) == closed_set.end()){
                    open_orderedset.insert(make_pair(puzzle.hm(tmp_state), make_pair(tmp_hashval, cur_f + 1)));
                    if(puzzle.sol_graph[tmp_hashval] == 0){
                        puzzle.sol_graph[tmp_hashval] = cur_state_hash;
                    }
                }
            }
        }
        closed_set.insert(cur_state_hash);
        open_orderedset.erase(find(open_orderedset.begin(), open_orderedset.end(), make_pair(puzzle.hm(cur_state), make_pair(cur_state_hash, cur_f))));
        if(open_orderedset.size() == 0){
            return 0;
        }   
        else{    
            pair<unsigned int, int> cur_node_info = (*open_orderedset.begin()).second; 
            cur_state = unhash_state(cur_node_info.first);
            cur_f = cur_node_info.second;
        }
    }
}


int main(){
    prod_sys puzzle8;
    unsigned int goal;
    if(unsigned int goal = astar_solver(puzzle8)) {
        cout << "Solved :)" << endl << goal ;
        do{
            cout << " <- " << puzzle8.sol_graph[goal];
            goal = puzzle8.sol_graph[goal];
        } while(goal != puzzle8.sol_graph[goal]);
    }
    else    cout << "Unsolvable :{" << endl;
    return 0;
}