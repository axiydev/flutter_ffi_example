#include <iostream>
using std::cout;
using std::endl;
enum Color{red=0,blue,yellow=-3};

struct node{
    int data;
    struct node *next;
};


int main() {
    auto strList={"salom","flutter g4","apple","iWatch"};
    for(auto item:strList){
        cout<<item<<endl;
    }
    Color a=Color::yellow;

    int result = a+blue;
    cout<<a<<endl;
    cout<<result<<endl;
    switch(a){
        case red:
            cout<<"red"<<endl;
            break;
        case blue:
            cout<<"blue"<<endl;
            break;
        case yellow:
            cout<<"yellow"<<endl;
            break;
    }

    struct node *head,*middle,*last;

    head = static_cast<node *>(malloc(sizeof(struct node)));
    middle=static_cast<node *>(malloc(sizeof(struct node)));
    last=static_cast<node *>(malloc(sizeof(struct node)));

    head->data=10;
    middle->data=20;
    last->data=30;
    head->next=middle;
    middle->next=last;
    last->next=NULL;
     while(head->next!=NULL){
         printf("%d\n",head->data);
         head=head->next;
     }

    return 0;
}
