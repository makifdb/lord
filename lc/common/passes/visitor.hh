#ifndef LORD_LC_COMMON_VISITOR_HH
#define LORD_LC_COMMON_VISITOR_HH

#include "../comp_state.hh"

class Visitor {
public:
	CompState *state = NULL;

	Visitor(CompState *state);
	virtual ~Visitor() {};

	void visit(Node *n);

	#define X(token)\
		virtual void visit_##token(Node *n) {\
			for (auto c : n->ns)\
				visit(c);\
		};
		LORD_LP_TOKENS
	#undef X
};

void pipe_visitors(Node *n, std::vector<Visitor*> visitors);

#endif