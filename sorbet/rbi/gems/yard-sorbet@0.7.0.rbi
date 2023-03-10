# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `yard-sorbet` gem.
# Please instead update this file by running `bin/tapioca gem yard-sorbet`.

class YARD::CodeObjects::Base
  # source://yard/0.9.28/lib/yard/code_objects/base.rb#238
  def initialize(namespace, name, *_arg2); end

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#322
  def ==(other); end

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#342
  def [](key); end

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#355
  def []=(key, value); end

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#290
  def add_file(file, line = T.unsafe(nil), has_comments = T.unsafe(nil)); end

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#557
  def add_tag(*tags); end

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#166
  def base_docstring; end

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#263
  def copy_to(other); end

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#404
  def docstring(locale = T.unsafe(nil)); end

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#426
  def docstring=(comments); end

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#170
  def dynamic; end

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#170
  def dynamic=(_arg0); end

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#178
  def dynamic?; end

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#322
  def eql?(other); end

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#322
  def equal?(other); end

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#306
  def file; end

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#137
  def files; end

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#501
  def format(options = T.unsafe(nil)); end

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#174
  def group; end

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#174
  def group=(_arg0); end

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#552
  def has_tag?(name); end

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#333
  def hash; end

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#509
  def inspect; end

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#314
  def line; end

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#372
  def method_missing(meth, *args, &block); end

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#278
  def name(prefix = T.unsafe(nil)); end

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#142
  def namespace; end

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#518
  def namespace=(obj); end

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#142
  def parent; end

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#518
  def parent=(obj); end

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#449
  def path; end

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#471
  def relative_path(other); end

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#563
  def root?; end

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#572
  def sep; end

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#159
  def signature; end

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#159
  def signature=(_arg0); end

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#146
  def source; end

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#387
  def source=(statement); end

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#152
  def source_type; end

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#152
  def source_type=(_arg0); end

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#544
  def tag(name); end

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#548
  def tags(name = T.unsafe(nil)); end

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#464
  def title; end

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#336
  def to_ary; end

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#449
  def to_s; end

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#436
  def type; end

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#181
  def visibility; end

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#183
  def visibility=(v); end

  protected

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#583
  def copyable_attributes; end

  private

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#595
  def format_source(source); end

  # source://yard/0.9.28/lib/yard/code_objects/base.rb#602
  def translate_docstring(locale); end

  class << self
    # source://yard/0.9.28/lib/yard/code_objects/base.rb#219
    def ===(other); end

    # source://yard/0.9.28/lib/yard/code_objects/base.rb#189
    def new(namespace, name, *args, &block); end
  end
end

class YARD::CodeObjects::ClassObject < ::YARD::CodeObjects::NamespaceObject
  # source://yard/0.9.28/lib/yard/code_objects/class_object.rb#15
  def initialize(namespace, name, *args, &block); end

  # source://yard/0.9.28/lib/yard/code_objects/class_object.rb#101
  def constants(opts = T.unsafe(nil)); end

  # source://yard/0.9.28/lib/yard/code_objects/class_object.rb#45
  def inheritance_tree(include_mods = T.unsafe(nil)); end

  # source://yard/0.9.28/lib/yard/code_objects/class_object.rb#109
  def inherited_constants; end

  # source://yard/0.9.28/lib/yard/code_objects/class_object.rb#79
  def inherited_meths(opts = T.unsafe(nil)); end

  # source://yard/0.9.28/lib/yard/code_objects/class_object.rb#35
  def is_exception?; end

  # source://yard/0.9.28/lib/yard/code_objects/class_object.rb#66
  def meths(opts = T.unsafe(nil)); end

  # source://yard/0.9.28/lib/yard/code_objects/class_object.rb#10
  def superclass; end

  # source://yard/0.9.28/lib/yard/code_objects/class_object.rb#125
  def superclass=(object); end
end

class YARD::CodeObjects::MethodObject < ::YARD::CodeObjects::Base
  # source://yard/0.9.28/lib/yard/code_objects/method_object.rb#37
  def initialize(namespace, name, scope = T.unsafe(nil), &block); end

  # source://yard/0.9.28/lib/yard/code_objects/method_object.rb#149
  def aliases; end

  # source://yard/0.9.28/lib/yard/code_objects/method_object.rb#93
  def attr_info; end

  # source://yard/0.9.28/lib/yard/code_objects/method_object.rb#78
  def constructor?; end

  # source://yard/0.9.28/lib/yard/code_objects/method_object.rb#18
  def explicit; end

  # source://yard/0.9.28/lib/yard/code_objects/method_object.rb#18
  def explicit=(_arg0); end

  # source://yard/0.9.28/lib/yard/code_objects/method_object.rb#126
  def is_alias?; end

  # source://yard/0.9.28/lib/yard/code_objects/method_object.rb#114
  def is_attribute?; end

  # source://yard/0.9.28/lib/yard/code_objects/method_object.rb#134
  def is_explicit?; end

  # source://yard/0.9.28/lib/yard/code_objects/method_object.rb#85
  def module_function?; end

  # source://yard/0.9.28/lib/yard/code_objects/method_object.rb#175
  def name(prefix = T.unsafe(nil)); end

  # source://yard/0.9.28/lib/yard/code_objects/method_object.rb#141
  def overridden_method; end

  # source://yard/0.9.28/lib/yard/code_objects/method_object.rb#25
  def parameters; end

  # source://yard/0.9.28/lib/yard/code_objects/method_object.rb#25
  def parameters=(_arg0); end

  # source://yard/0.9.28/lib/yard/code_objects/method_object.rb#161
  def path; end

  # source://yard/0.9.28/lib/yard/code_objects/method_object.rb#107
  def reader?; end

  # source://yard/0.9.28/lib/yard/code_objects/method_object.rb#11
  def scope; end

  # source://yard/0.9.28/lib/yard/code_objects/method_object.rb#58
  def scope=(v); end

  # source://yard/0.9.28/lib/yard/code_objects/method_object.rb#182
  def sep; end

  # source://yard/0.9.28/lib/yard/code_objects/method_object.rb#100
  def writer?; end

  protected

  # source://yard/0.9.28/lib/yard/code_objects/method_object.rb#192
  def copyable_attributes; end
end

class YARD::CodeObjects::NamespaceObject < ::YARD::CodeObjects::Base
  # source://yard/0.9.28/lib/yard/code_objects/namespace_object.rb#56
  def initialize(namespace, name, *args, &block); end

  # source://yard/0.9.28/lib/yard/code_objects/namespace_object.rb#44
  def aliases; end

  # source://yard/0.9.28/lib/yard/code_objects/namespace_object.rb#39
  def attributes; end

  # source://yard/0.9.28/lib/yard/code_objects/namespace_object.rb#86
  def child(opts = T.unsafe(nil)); end

  # source://yard/0.9.28/lib/yard/code_objects/namespace_object.rb#16
  def children; end

  # source://yard/0.9.28/lib/yard/code_objects/namespace_object.rb#69
  def class_attributes; end

  # source://yard/0.9.28/lib/yard/code_objects/namespace_object.rb#48
  def class_mixins; end

  # source://yard/0.9.28/lib/yard/code_objects/namespace_object.rb#164
  def constants(opts = T.unsafe(nil)); end

  # source://yard/0.9.28/lib/yard/code_objects/namespace_object.rb#186
  def cvars; end

  # source://yard/0.9.28/lib/yard/code_objects/namespace_object.rb#12
  def groups; end

  # source://yard/0.9.28/lib/yard/code_objects/namespace_object.rb#12
  def groups=(_arg0); end

  # source://yard/0.9.28/lib/yard/code_objects/namespace_object.rb#172
  def included_constants; end

  # source://yard/0.9.28/lib/yard/code_objects/namespace_object.rb#144
  def included_meths(opts = T.unsafe(nil)); end

  # source://yard/0.9.28/lib/yard/code_objects/namespace_object.rb#76
  def instance_attributes; end

  # source://yard/0.9.28/lib/yard/code_objects/namespace_object.rb#52
  def instance_mixins; end

  # source://yard/0.9.28/lib/yard/code_objects/namespace_object.rb#113
  def meths(opts = T.unsafe(nil)); end

  # source://yard/0.9.28/lib/yard/code_objects/namespace_object.rb#194
  def mixins(*scopes); end
end

class YARD::Docstring < ::String
  # source://yard/0.9.28/lib/yard/docstring.rb#103
  def initialize(content = T.unsafe(nil), object = T.unsafe(nil)); end

  # source://yard/0.9.28/lib/yard/docstring.rb#116
  def +(other); end

  # source://yard/0.9.28/lib/yard/docstring.rb#242
  def add_tag(*tags); end

  # source://yard/0.9.28/lib/yard/docstring.rb#53
  def all; end

  # source://yard/0.9.28/lib/yard/docstring.rb#132
  def all=(content, parse = T.unsafe(nil)); end

  # source://yard/0.9.28/lib/yard/docstring.rb#310
  def blank?(only_visible_tags = T.unsafe(nil)); end

  # source://yard/0.9.28/lib/yard/docstring.rb#300
  def delete_tag_if(&block); end

  # source://yard/0.9.28/lib/yard/docstring.rb#291
  def delete_tags(name); end

  # source://yard/0.9.28/lib/yard/docstring.rb#153
  def dup; end

  # source://yard/0.9.28/lib/yard/docstring.rb#283
  def has_tag?(name); end

  # source://yard/0.9.28/lib/yard/docstring.rb#56
  def hash_flag; end

  # source://yard/0.9.28/lib/yard/docstring.rb#57
  def hash_flag=(v); end

  # source://yard/0.9.28/lib/yard/docstring.rb#167
  def line; end

  # source://yard/0.9.28/lib/yard/docstring.rb#50
  def line_range; end

  # source://yard/0.9.28/lib/yard/docstring.rb#50
  def line_range=(_arg0); end

  # source://yard/0.9.28/lib/yard/docstring.rb#47
  def object; end

  # source://yard/0.9.28/lib/yard/docstring.rb#47
  def object=(_arg0); end

  # source://yard/0.9.28/lib/yard/docstring.rb#44
  def ref_tags; end

  # source://yard/0.9.28/lib/yard/docstring.rb#132
  def replace(content, parse = T.unsafe(nil)); end

  # source://yard/0.9.28/lib/yard/docstring.rb#328
  def resolve_reference; end

  # source://yard/0.9.28/lib/yard/docstring.rb#173
  def summary; end

  # source://yard/0.9.28/lib/yard/docstring.rb#265
  def tag(name); end

  # source://yard/0.9.28/lib/yard/docstring.rb#273
  def tags(name = T.unsafe(nil)); end

  # source://yard/0.9.28/lib/yard/docstring.rb#207
  def to_raw; end

  # source://yard/0.9.28/lib/yard/docstring.rb#125
  def to_s; end

  private

  # source://yard/0.9.28/lib/yard/docstring.rb#344
  def convert_ref_tags; end

  # source://yard/0.9.28/lib/yard/docstring.rb#369
  def parse_comments(comments); end

  # source://yard/0.9.28/lib/yard/docstring.rb#382
  def stable_sort_by(list); end

  class << self
    # source://yard/0.9.28/lib/yard/docstring.rb#28
    def default_parser; end

    # source://yard/0.9.28/lib/yard/docstring.rb#28
    def default_parser=(_arg0); end

    # source://yard/0.9.28/lib/yard/docstring.rb#77
    def new!(text, tags = T.unsafe(nil), object = T.unsafe(nil), raw_data = T.unsafe(nil), ref_object = T.unsafe(nil)); end

    # source://yard/0.9.28/lib/yard/docstring.rb#38
    def parser(*args); end
  end
end

# source://yard/0.9.28/lib/yard/docstring.rb#61
YARD::Docstring::META_MATCH = T.let(T.unsafe(nil), Regexp)

class YARD::Handlers::Ruby::ClassHandler < ::YARD::Handlers::Ruby::Base
  include ::YARDSorbet::Handlers::StructClassHandler
end

# Types are documentation
#
# source://yard-sorbet//lib/yard-sorbet/version.rb#5
module YARDSorbet; end

# Extract & re-add directives to a docstring
#
# source://yard-sorbet//lib/yard-sorbet/directives.rb#6
module YARDSorbet::Directives
  class << self
    # source://yard-sorbet//lib/yard-sorbet/directives.rb#21
    sig { params(docstring: ::String, directives: T::Array[::String]).void }
    def add_directives(docstring, directives); end

    # source://yard-sorbet//lib/yard-sorbet/directives.rb#10
    sig { params(docstring: T.nilable(::String)).returns([::YARD::Docstring, T::Array[::String]]) }
    def extract_directives(docstring); end
  end
end

# Custom YARD Handlers
#
# @see https://rubydoc.info/gems/yard/YARD/Handlers/Base YARD Base Handler documentation
#
# source://yard-sorbet//lib/yard-sorbet/handlers.rb#7
module YARDSorbet::Handlers; end

# Apllies an `@abstract` tag to `abstract!`/`interface!` modules (if not alerady present).
#
# source://yard-sorbet//lib/yard-sorbet/handlers/abstract_dsl_handler.rb#7
class YARDSorbet::Handlers::AbstractDSLHandler < ::YARD::Handlers::Ruby::Base
  # source://yard-sorbet//lib/yard-sorbet/handlers/abstract_dsl_handler.rb#21
  sig { void }
  def process; end
end

# Extra text for class namespaces
#
# source://yard-sorbet//lib/yard-sorbet/handlers/abstract_dsl_handler.rb#18
YARDSorbet::Handlers::AbstractDSLHandler::CLASS_TAG_TEXT = T.let(T.unsafe(nil), String)

# The text accompanying the `@abstract` tag.
#
# @see https://github.com/lsegal/yard/blob/main/templates/default/docstring/html/abstract.erb The `@abstract` tag template
#
# source://yard-sorbet//lib/yard-sorbet/handlers/abstract_dsl_handler.rb#16
YARDSorbet::Handlers::AbstractDSLHandler::TAG_TEXT = T.let(T.unsafe(nil), String)

# Handle `enums` calls, registering enum values as constants
#
# source://yard-sorbet//lib/yard-sorbet/handlers/enums_handler.rb#7
class YARDSorbet::Handlers::EnumsHandler < ::YARD::Handlers::Ruby::Base
  # source://yard-sorbet//lib/yard-sorbet/handlers/enums_handler.rb#14
  sig { void }
  def process; end

  private

  # source://yard-sorbet//lib/yard-sorbet/handlers/enums_handler.rb#29
  sig { params(node: ::YARD::Parser::Ruby::AstNode).returns(T::Boolean) }
  def const_assign_node?(node); end
end

# Extends any modules included via `mixes_in_class_methods`
#
# @see https://sorbet.org/docs/abstract#interfaces-and-the-included-hook Sorbet `mixes_in_class_methods` documentation
#
# source://yard-sorbet//lib/yard-sorbet/handlers/include_handler.rb#9
class YARDSorbet::Handlers::IncludeHandler < ::YARD::Handlers::Ruby::Base
  # source://yard-sorbet//lib/yard-sorbet/handlers/include_handler.rb#16
  sig { void }
  def process; end

  private

  # source://yard-sorbet//lib/yard-sorbet/handlers/include_handler.rb#30
  sig { returns(::YARD::CodeObjects::NamespaceObject) }
  def included_in; end
end

# Tracks modules that invoke `mixes_in_class_methods` for use in {IncludeHandler}
#
# @see https://sorbet.org/docs/abstract#interfaces-and-the-included-hook Sorbet `mixes_in_class_methods` documentation
#
# source://yard-sorbet//lib/yard-sorbet/handlers/mixes_in_class_methods_handler.rb#9
class YARDSorbet::Handlers::MixesInClassMethodsHandler < ::YARD::Handlers::Ruby::Base
  # source://yard-sorbet//lib/yard-sorbet/handlers/mixes_in_class_methods_handler.rb#23
  sig { void }
  def process; end

  class << self
    # source://yard-sorbet//lib/yard-sorbet/handlers/mixes_in_class_methods_handler.rb#18
    sig { params(code_obj: ::String).returns(T.nilable(::String)) }
    def mixed_in_class_methods(code_obj); end
  end
end

# A YARD Handler for Sorbet type declarations
#
# source://yard-sorbet//lib/yard-sorbet/handlers/sig_handler.rb#7
class YARDSorbet::Handlers::SigHandler < ::YARD::Handlers::Ruby::Base
  # Swap the method definition docstring and the sig docstring.
  # Parse relevant parts of the `sig` and include them as well.
  #
  # source://yard-sorbet//lib/yard-sorbet/handlers/sig_handler.rb#20
  sig { void }
  def process; end

  private

  # source://yard-sorbet//lib/yard-sorbet/handlers/sig_handler.rb#52
  sig do
    params(
      method_node: ::YARD::Parser::Ruby::AstNode,
      node: ::YARD::Parser::Ruby::AstNode,
      docstring: ::YARD::Docstring
    ).void
  end
  def parse_params(method_node, node, docstring); end

  # source://yard-sorbet//lib/yard-sorbet/handlers/sig_handler.rb#64
  sig { params(node: ::YARD::Parser::Ruby::AstNode, docstring: ::YARD::Docstring).void }
  def parse_return(node, docstring); end

  # source://yard-sorbet//lib/yard-sorbet/handlers/sig_handler.rb#32
  sig { params(method_node: ::YARD::Parser::Ruby::AstNode, docstring: ::YARD::Docstring).void }
  def parse_sig(method_node, docstring); end
end

# These node types attached to sigs represent attr_* declarations
#
# source://yard-sorbet//lib/yard-sorbet/handlers/sig_handler.rb#14
YARDSorbet::Handlers::SigHandler::ATTR_NODE_TYPES = T.let(T.unsafe(nil), Array)

# Class-level handler that folds all `const` and `prop` declarations into the constructor documentation
# this needs to be injected as a module otherwise the default Class handler will overwrite documentation
#
# @note this module is included in `YARD::Handlers::Ruby::ClassHandler`
#
# source://yard-sorbet//lib/yard-sorbet/handlers/struct_class_handler.rb#10
module YARDSorbet::Handlers::StructClassHandler
  # source://yard-sorbet//lib/yard-sorbet/handlers/struct_class_handler.rb#14
  sig { void }
  def process; end

  private

  # source://yard-sorbet//lib/yard-sorbet/handlers/struct_class_handler.rb#50
  sig do
    params(
      object: ::YARD::CodeObjects::MethodObject,
      props: T::Array[::YARDSorbet::TStructProp],
      docstring: ::YARD::Docstring,
      directives: T::Array[::String]
    ).void
  end
  def decorate_t_struct_init(object, props, docstring, directives); end

  # Create a virtual `initialize` method with all the `prop`/`const` arguments
  #
  # source://yard-sorbet//lib/yard-sorbet/handlers/struct_class_handler.rb#30
  sig { params(props: T::Array[::YARDSorbet::TStructProp], class_ns: ::YARD::CodeObjects::ClassObject).void }
  def process_t_struct_props(props, class_ns); end

  # source://yard-sorbet//lib/yard-sorbet/handlers/struct_class_handler.rb#60
  sig { params(props: T::Array[::YARDSorbet::TStructProp]).returns(T::Array[[::String, T.nilable(::String)]]) }
  def to_object_parameters(props); end
end

# Handles all `const`/`prop` calls, creating accessor methods, and compiles them for later usage at the class level
# in creating a constructor
#
# source://yard-sorbet//lib/yard-sorbet/handlers/struct_prop_handler.rb#8
class YARDSorbet::Handlers::StructPropHandler < ::YARD::Handlers::Ruby::Base
  # source://yard-sorbet//lib/yard-sorbet/handlers/struct_prop_handler.rb#15
  sig { void }
  def process; end

  private

  # Add the source and docstring to the method object
  #
  # source://yard-sorbet//lib/yard-sorbet/handlers/struct_prop_handler.rb#28
  sig { params(object: ::YARD::CodeObjects::MethodObject, prop: ::YARDSorbet::TStructProp).void }
  def decorate_object(object, prop); end

  # Get the default prop value
  #
  # source://yard-sorbet//lib/yard-sorbet/handlers/struct_prop_handler.rb#39
  sig { returns(T.nilable(::String)) }
  def default_value; end

  # source://yard-sorbet//lib/yard-sorbet/handlers/struct_prop_handler.rb#44
  sig { params(name: ::String).returns(::YARDSorbet::TStructProp) }
  def make_prop(name); end

  # Register the field explicitly as an attribute.
  # While `const` attributes are immutable, `prop` attributes may be reassigned.
  #
  # source://yard-sorbet//lib/yard-sorbet/handlers/struct_prop_handler.rb#57
  sig { params(object: ::YARD::CodeObjects::MethodObject, name: ::String).void }
  def register_attrs(object, name); end

  # Store the prop for use in the constructor definition
  #
  # source://yard-sorbet//lib/yard-sorbet/handlers/struct_prop_handler.rb#65
  sig { params(prop: ::YARDSorbet::TStructProp).void }
  def update_state(prop); end
end

# Helper methods for working with `YARD` AST Nodes
#
# source://yard-sorbet//lib/yard-sorbet/node_utils.rb#6
module YARDSorbet::NodeUtils
  class << self
    # Traverse AST nodes in breadth-first order
    #
    # @note This will skip over some node types.
    # @yield [YARD::Parser::Ruby::AstNode]
    #
    # source://yard-sorbet//lib/yard-sorbet/node_utils.rb#22
    sig do
      params(
        node: ::YARD::Parser::Ruby::AstNode,
        _blk: T.proc.params(n: ::YARD::Parser::Ruby::AstNode).void
      ).void
    end
    def bfs_traverse(node, &_blk); end

    # Gets the node that a sorbet `sig` can be attached do, bypassing visisbility modifiers and the like
    #
    # source://yard-sorbet//lib/yard-sorbet/node_utils.rb#34
    sig do
      params(
        node: ::YARD::Parser::Ruby::AstNode
      ).returns(T.any(::YARD::Parser::Ruby::MethodCallNode, ::YARD::Parser::Ruby::MethodDefinitionNode))
    end
    def get_method_node(node); end

    # Find and return the adjacent node (ascending)
    #
    # @raise [IndexError] if the node does not have an adjacent sibling (ascending)
    #
    # source://yard-sorbet//lib/yard-sorbet/node_utils.rb#48
    sig { params(node: ::YARD::Parser::Ruby::AstNode).returns(::YARD::Parser::Ruby::AstNode) }
    def sibling_node(node); end
  end
end

# Command node types that can have type signatures
#
# source://yard-sorbet//lib/yard-sorbet/node_utils.rb#10
YARDSorbet::NodeUtils::ATTRIBUTE_METHODS = T.let(T.unsafe(nil), Array)

# Skip these method contents during BFS node traversal, they can have their own nested types via `T.Proc`
#
# source://yard-sorbet//lib/yard-sorbet/node_utils.rb#12
YARDSorbet::NodeUtils::SKIP_METHOD_CONTENTS = T.let(T.unsafe(nil), Array)

# Node types that can have type signatures
#
# source://yard-sorbet//lib/yard-sorbet/node_utils.rb#14
YARDSorbet::NodeUtils::SigableNode = T.type_alias { T.any(::YARD::Parser::Ruby::MethodCallNode, ::YARD::Parser::Ruby::MethodDefinitionNode) }

# Translate `sig` type syntax to `YARD` type syntax.
#
# source://yard-sorbet//lib/yard-sorbet/sig_to_yard.rb#6
module YARDSorbet::SigToYARD
  class << self
    # @see https://yardoc.org/types.html
    #
    # source://yard-sorbet//lib/yard-sorbet/sig_to_yard.rb#21
    sig { params(node: ::YARD::Parser::Ruby::AstNode).returns(T::Array[::String]) }
    def convert(node); end

    private

    # source://yard-sorbet//lib/yard-sorbet/sig_to_yard.rb#54
    sig { params(node: ::YARD::Parser::Ruby::AstNode).returns(::String) }
    def build_generic_type(node); end

    # source://yard-sorbet//lib/yard-sorbet/sig_to_yard.rb#63
    sig { params(node: ::YARD::Parser::Ruby::AstNode).returns(T::Array[::String]) }
    def convert_aref(node); end

    # source://yard-sorbet//lib/yard-sorbet/sig_to_yard.rb#75
    sig { params(node: ::YARD::Parser::Ruby::AstNode).returns([::String]) }
    def convert_array(node); end

    # source://yard-sorbet//lib/yard-sorbet/sig_to_yard.rb#83
    sig { params(node: ::YARD::Parser::Ruby::MethodCallNode).returns(T::Array[::String]) }
    def convert_call(node); end

    # source://yard-sorbet//lib/yard-sorbet/sig_to_yard.rb#88
    sig { params(node: ::YARD::Parser::Ruby::AstNode).returns([::String]) }
    def convert_collection(node); end

    # source://yard-sorbet//lib/yard-sorbet/sig_to_yard.rb#95
    sig { params(node: ::YARD::Parser::Ruby::AstNode).returns([::String]) }
    def convert_hash(node); end

    # source://yard-sorbet//lib/yard-sorbet/sig_to_yard.rb#103
    sig { params(node: ::YARD::Parser::Ruby::AstNode).returns(T::Array[::String]) }
    def convert_list(node); end

    # source://yard-sorbet//lib/yard-sorbet/sig_to_yard.rb#27
    sig { params(node: ::YARD::Parser::Ruby::AstNode).returns(T::Array[::String]) }
    def convert_node(node); end

    # source://yard-sorbet//lib/yard-sorbet/sig_to_yard.rb#36
    sig { params(node: ::YARD::Parser::Ruby::AstNode).returns(T::Array[::String]) }
    def convert_node_type(node); end

    # source://yard-sorbet//lib/yard-sorbet/sig_to_yard.rb#108
    sig { params(node_source: ::String).returns([::String]) }
    def convert_ref(node_source); end

    # source://yard-sorbet//lib/yard-sorbet/sig_to_yard.rb#113
    sig { params(node: ::YARD::Parser::Ruby::MethodCallNode).returns(T::Array[::String]) }
    def convert_t_method(node); end

    # source://yard-sorbet//lib/yard-sorbet/sig_to_yard.rb#125
    sig { params(node: ::YARD::Parser::Ruby::AstNode).returns([::String]) }
    def convert_unknown(node); end
  end
end

# source://yard-sorbet//lib/yard-sorbet/sig_to_yard.rb#9
YARDSorbet::SigToYARD::REF_TYPES = T.let(T.unsafe(nil), Hash)

# Used to store the details of a `T::Struct` `prop` definition
#
# source://yard-sorbet//lib/yard-sorbet/t_struct_prop.rb#6
class YARDSorbet::TStructProp < ::T::Struct
  const :default, T.nilable(::String)
  const :doc, ::String
  const :prop_name, ::String
  const :source, ::String
  const :types, T::Array[::String]

  class << self
    # source://sorbet-runtime/0.5.10499/lib/types/struct.rb#13
    def inherited(s); end
  end
end

# Helper methods for working with `YARD` tags
#
# source://yard-sorbet//lib/yard-sorbet/tag_utils.rb#6
module YARDSorbet::TagUtils
  class << self
    # source://yard-sorbet//lib/yard-sorbet/tag_utils.rb#13
    sig do
      params(
        docstring: ::YARD::Docstring,
        tag_name: ::String,
        name: T.nilable(::String)
      ).returns(T.nilable(::YARD::Tags::Tag))
    end
    def find_tag(docstring, tag_name, name); end

    # Create or update a `YARD` tag with type information
    #
    # source://yard-sorbet//lib/yard-sorbet/tag_utils.rb#27
    sig do
      params(
        docstring: ::YARD::Docstring,
        tag_name: ::String,
        types: T.nilable(T::Array[::String]),
        name: T.nilable(::String),
        text: ::String
      ).void
    end
    def upsert_tag(docstring, tag_name, types = T.unsafe(nil), name = T.unsafe(nil), text = T.unsafe(nil)); end
  end
end

# {https://rubygems.org/gems/yard-sorbet Version history}
#
# source://yard-sorbet//lib/yard-sorbet/version.rb#7
YARDSorbet::VERSION = T.let(T.unsafe(nil), String)
