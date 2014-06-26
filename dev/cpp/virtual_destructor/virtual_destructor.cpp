#include <iostream>

using namespace std;

class A1 {
	public:
		A1 () {
			cout << "A1() called" << endl;
		}

		virtual ~A1 () { // won't be called if non-virtual
			cout << "~A1() called" << endl;
		}
};

class A2 : public A1 {
	public:
		A2 () {
			cout << "A2() called" << endl;
		}

		~A2 () {
			cout << "~A2() called" << endl;
		}
};

int main (int argc, char *argv[])
{
	A1 *ap = new A2();
	delete ap;
}
