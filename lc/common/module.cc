#include "lc.hh"

Module::Module(Compiler *c)
	: c(c)
{
}

bool Module::load_file(std::string fpath)
{
	name = fpath;

	std::ifstream ifs(fpath);
	if (ifs.is_open() == false)
		return false;

	src = std::string(
		(std::istreambuf_iterator<char>(ifs)),
		(std::istreambuf_iterator<char>())
	);

	auto l = Lexer(src);
	ast = parse(&l);

	pipe_visitors(ast, {
		new DesugarVisitor(this),
		new StructVisitor(this),
		new StructFieldVisitor(this),
		new FnAndMethodVisitor(this),
		new MethodBodyVisitor(this),
	});

	return true;
}

void Module::print()
{
	std::cout << "=== MODULE '" << name << "' ===" << std::endl;

	std::cout << " => AST " << std::endl;
	ast->print(1);

	std::cout << " => STRUCTS " << std::endl;
	structmgr.print();

	std::cout << " => FUNCTIONS " << std::endl;
	fnmgr.print();
}

std::string Module::genpy()
{
	PygenVisitor pygenv(this);
	pygenv.visit(ast);
	return pygenv.buf;
}
