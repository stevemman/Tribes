Īē
ō
:
Add
x"T
y"T
z"T"
Ttype:
2	
x
Assign
ref"T

value"T

output_ref"T"	
Ttype"
validate_shapebool("
use_lockingbool(
B
AssignVariableOp
resource
value"dtype"
dtypetype
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
N
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype"
Truncatebool( 
h
ConcatV2
values"T*N
axis"Tidx
output"T"
Nint(0"	
Ttype"
Tidxtype0:
2	
8
Const
output"dtype"
valuetensor"
dtypetype
W

ExpandDims

input"T
dim"Tdim
output"T"	
Ttype"
Tdimtype0:
2	
V
HistogramSummary
tag
values"T
summary"
Ttype0:
2	
.
Identity

input"T
output"T"	
Ttype
?
	LessEqual
x"T
y"T
z
"
Ttype:
2	
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
8
Maximum
x"T
y"T
z"T"
Ttype:

2	
N
Merge
inputs"T*N
output"T
value_index"	
Ttype"
Nint(0
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(
8
Minimum
x"T
y"T
z"T"
Ttype:

2	
=
Mul
x"T
y"T
z"T"
Ttype:
2	

NoOp
E
NotEqual
x"T
y"T
z
"
Ttype:
2	

M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
X
PlaceholderWithDefault
input"dtype
output"dtype"
dtypetype"
shapeshape
~
RandomUniform

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	
@
ReadVariableOp
resource
value"dtype"
dtypetype
>
RealDiv
x"T
y"T
z"T"
Ttype:
2	
E
Relu
features"T
activations"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
P
ScalarSummary
tags
values"T
summary"
Ttype:
2	
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
O
Size

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
ö
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
:
Sub
x"T
y"T
z"T"
Ttype:
2	

Sum

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
M
Switch	
data"T
pred

output_false"T
output_true"T"	
Ttype
q
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape
9
VarIsInitializedOp
resource
is_initialized

s

VariableV2
ref"dtype"
shapeshape"
dtypetype"
	containerstring "
shared_namestring "serve*1.14.02unknown8ś

global_step/Initializer/zerosConst*
value	B	 R *
_class
loc:@global_step*
dtype0	*
_output_shapes
: 
k
global_step
VariableV2*
shape: *
_class
loc:@global_step*
dtype0	*
_output_shapes
: 

global_step/AssignAssignglobal_stepglobal_step/Initializer/zeros*
T0	*
_class
loc:@global_step*
_output_shapes
: 
j
global_step/readIdentityglobal_step*
T0	*
_class
loc:@global_step*
_output_shapes
: 
o
old_terrain_source_1Placeholder*
shape:’’’’’’’’’*
dtype0*#
_output_shapes
:’’’’’’’’’
o
old_terrain_target_1Placeholder*
shape:’’’’’’’’’*
dtype0*#
_output_shapes
:’’’’’’’’’
h
old_hp_sourcePlaceholder*
shape:’’’’’’’’’*
dtype0*#
_output_shapes
:’’’’’’’’’
l
old_attack_sourcePlaceholder*
shape:’’’’’’’’’*
dtype0*#
_output_shapes
:’’’’’’’’’
m
old_defence_sourcePlaceholder*
shape:’’’’’’’’’*
dtype0*#
_output_shapes
:’’’’’’’’’
h
old_hp_targetPlaceholder*
shape:’’’’’’’’’*
dtype0*#
_output_shapes
:’’’’’’’’’
l
old_attack_targetPlaceholder*
shape:’’’’’’’’’*
dtype0*#
_output_shapes
:’’’’’’’’’
m
old_defence_targetPlaceholder*
shape:’’’’’’’’’*
dtype0*#
_output_shapes
:’’’’’’’’’

Kdnn/input_from_feature_columns/input_layer/old_attack_source/ExpandDims/dimConst*
valueB :
’’’’’’’’’*
dtype0*
_output_shapes
: 
ē
Gdnn/input_from_feature_columns/input_layer/old_attack_source/ExpandDims
ExpandDimsold_attack_sourceKdnn/input_from_feature_columns/input_layer/old_attack_source/ExpandDims/dim*
T0*'
_output_shapes
:’’’’’’’’’
µ
pdnn/input_from_feature_columns/input_layer/old_attack_source/old_attack_source_normalize/clip_by_value/Minimum/yConst*
valueB
 *   @*
dtype0*
_output_shapes
: 
ę
ndnn/input_from_feature_columns/input_layer/old_attack_source/old_attack_source_normalize/clip_by_value/MinimumMinimumGdnn/input_from_feature_columns/input_layer/old_attack_source/ExpandDimspdnn/input_from_feature_columns/input_layer/old_attack_source/old_attack_source_normalize/clip_by_value/Minimum/y*
T0*'
_output_shapes
:’’’’’’’’’
­
hdnn/input_from_feature_columns/input_layer/old_attack_source/old_attack_source_normalize/clip_by_value/yConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
ż
fdnn/input_from_feature_columns/input_layer/old_attack_source/old_attack_source_normalize/clip_by_valueMaximumndnn/input_from_feature_columns/input_layer/old_attack_source/old_attack_source_normalize/clip_by_value/Minimumhdnn/input_from_feature_columns/input_layer/old_attack_source/old_attack_source_normalize/clip_by_value/y*
T0*'
_output_shapes
:’’’’’’’’’
£
^dnn/input_from_feature_columns/input_layer/old_attack_source/old_attack_source_normalize/sub/yConst*
valueB
 *9ć@*
dtype0*
_output_shapes
: 
Ż
\dnn/input_from_feature_columns/input_layer/old_attack_source/old_attack_source_normalize/subSubfdnn/input_from_feature_columns/input_layer/old_attack_source/old_attack_source_normalize/clip_by_value^dnn/input_from_feature_columns/input_layer/old_attack_source/old_attack_source_normalize/sub/y*
T0*'
_output_shapes
:’’’’’’’’’
§
bdnn/input_from_feature_columns/input_layer/old_attack_source/old_attack_source_normalize/truediv/yConst*
valueB
 *`š~?*
dtype0*
_output_shapes
: 
ß
`dnn/input_from_feature_columns/input_layer/old_attack_source/old_attack_source_normalize/truedivRealDiv\dnn/input_from_feature_columns/input_layer/old_attack_source/old_attack_source_normalize/subbdnn/input_from_feature_columns/input_layer/old_attack_source/old_attack_source_normalize/truediv/y*
T0*'
_output_shapes
:’’’’’’’’’
Ņ
Bdnn/input_from_feature_columns/input_layer/old_attack_source/ShapeShape`dnn/input_from_feature_columns/input_layer/old_attack_source/old_attack_source_normalize/truediv*
T0*
_output_shapes
:

Pdnn/input_from_feature_columns/input_layer/old_attack_source/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:

Rdnn/input_from_feature_columns/input_layer/old_attack_source/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:

Rdnn/input_from_feature_columns/input_layer/old_attack_source/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
Ž
Jdnn/input_from_feature_columns/input_layer/old_attack_source/strided_sliceStridedSliceBdnn/input_from_feature_columns/input_layer/old_attack_source/ShapePdnn/input_from_feature_columns/input_layer/old_attack_source/strided_slice/stackRdnn/input_from_feature_columns/input_layer/old_attack_source/strided_slice/stack_1Rdnn/input_from_feature_columns/input_layer/old_attack_source/strided_slice/stack_2*
shrink_axis_mask*
Index0*
T0*
_output_shapes
: 

Ldnn/input_from_feature_columns/input_layer/old_attack_source/Reshape/shape/1Const*
value	B :*
dtype0*
_output_shapes
: 

Jdnn/input_from_feature_columns/input_layer/old_attack_source/Reshape/shapePackJdnn/input_from_feature_columns/input_layer/old_attack_source/strided_sliceLdnn/input_from_feature_columns/input_layer/old_attack_source/Reshape/shape/1*
T0*
N*
_output_shapes
:
Æ
Ddnn/input_from_feature_columns/input_layer/old_attack_source/ReshapeReshape`dnn/input_from_feature_columns/input_layer/old_attack_source/old_attack_source_normalize/truedivJdnn/input_from_feature_columns/input_layer/old_attack_source/Reshape/shape*
T0*'
_output_shapes
:’’’’’’’’’

Kdnn/input_from_feature_columns/input_layer/old_attack_target/ExpandDims/dimConst*
valueB :
’’’’’’’’’*
dtype0*
_output_shapes
: 
ē
Gdnn/input_from_feature_columns/input_layer/old_attack_target/ExpandDims
ExpandDimsold_attack_targetKdnn/input_from_feature_columns/input_layer/old_attack_target/ExpandDims/dim*
T0*'
_output_shapes
:’’’’’’’’’
µ
pdnn/input_from_feature_columns/input_layer/old_attack_target/old_attack_target_normalize/clip_by_value/Minimum/yConst*
valueB
 *   @*
dtype0*
_output_shapes
: 
ę
ndnn/input_from_feature_columns/input_layer/old_attack_target/old_attack_target_normalize/clip_by_value/MinimumMinimumGdnn/input_from_feature_columns/input_layer/old_attack_target/ExpandDimspdnn/input_from_feature_columns/input_layer/old_attack_target/old_attack_target_normalize/clip_by_value/Minimum/y*
T0*'
_output_shapes
:’’’’’’’’’
­
hdnn/input_from_feature_columns/input_layer/old_attack_target/old_attack_target_normalize/clip_by_value/yConst*
valueB
 *    *
dtype0*
_output_shapes
: 
ż
fdnn/input_from_feature_columns/input_layer/old_attack_target/old_attack_target_normalize/clip_by_valueMaximumndnn/input_from_feature_columns/input_layer/old_attack_target/old_attack_target_normalize/clip_by_value/Minimumhdnn/input_from_feature_columns/input_layer/old_attack_target/old_attack_target_normalize/clip_by_value/y*
T0*'
_output_shapes
:’’’’’’’’’
£
^dnn/input_from_feature_columns/input_layer/old_attack_target/old_attack_target_normalize/sub/yConst*
valueB
 *Å-ū?*
dtype0*
_output_shapes
: 
Ż
\dnn/input_from_feature_columns/input_layer/old_attack_target/old_attack_target_normalize/subSubfdnn/input_from_feature_columns/input_layer/old_attack_target/old_attack_target_normalize/clip_by_value^dnn/input_from_feature_columns/input_layer/old_attack_target/old_attack_target_normalize/sub/y*
T0*'
_output_shapes
:’’’’’’’’’
§
bdnn/input_from_feature_columns/input_layer/old_attack_target/old_attack_target_normalize/truediv/yConst*
valueB
 *9u?*
dtype0*
_output_shapes
: 
ß
`dnn/input_from_feature_columns/input_layer/old_attack_target/old_attack_target_normalize/truedivRealDiv\dnn/input_from_feature_columns/input_layer/old_attack_target/old_attack_target_normalize/subbdnn/input_from_feature_columns/input_layer/old_attack_target/old_attack_target_normalize/truediv/y*
T0*'
_output_shapes
:’’’’’’’’’
Ņ
Bdnn/input_from_feature_columns/input_layer/old_attack_target/ShapeShape`dnn/input_from_feature_columns/input_layer/old_attack_target/old_attack_target_normalize/truediv*
T0*
_output_shapes
:

Pdnn/input_from_feature_columns/input_layer/old_attack_target/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:

Rdnn/input_from_feature_columns/input_layer/old_attack_target/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:

Rdnn/input_from_feature_columns/input_layer/old_attack_target/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
Ž
Jdnn/input_from_feature_columns/input_layer/old_attack_target/strided_sliceStridedSliceBdnn/input_from_feature_columns/input_layer/old_attack_target/ShapePdnn/input_from_feature_columns/input_layer/old_attack_target/strided_slice/stackRdnn/input_from_feature_columns/input_layer/old_attack_target/strided_slice/stack_1Rdnn/input_from_feature_columns/input_layer/old_attack_target/strided_slice/stack_2*
shrink_axis_mask*
Index0*
T0*
_output_shapes
: 

Ldnn/input_from_feature_columns/input_layer/old_attack_target/Reshape/shape/1Const*
value	B :*
dtype0*
_output_shapes
: 

Jdnn/input_from_feature_columns/input_layer/old_attack_target/Reshape/shapePackJdnn/input_from_feature_columns/input_layer/old_attack_target/strided_sliceLdnn/input_from_feature_columns/input_layer/old_attack_target/Reshape/shape/1*
T0*
N*
_output_shapes
:
Æ
Ddnn/input_from_feature_columns/input_layer/old_attack_target/ReshapeReshape`dnn/input_from_feature_columns/input_layer/old_attack_target/old_attack_target_normalize/truedivJdnn/input_from_feature_columns/input_layer/old_attack_target/Reshape/shape*
T0*'
_output_shapes
:’’’’’’’’’

Ldnn/input_from_feature_columns/input_layer/old_defence_source/ExpandDims/dimConst*
valueB :
’’’’’’’’’*
dtype0*
_output_shapes
: 
ź
Hdnn/input_from_feature_columns/input_layer/old_defence_source/ExpandDims
ExpandDimsold_defence_sourceLdnn/input_from_feature_columns/input_layer/old_defence_source/ExpandDims/dim*
T0*'
_output_shapes
:’’’’’’’’’
·
rdnn/input_from_feature_columns/input_layer/old_defence_source/old_defence_source_normalize/clip_by_value/Minimum/yConst*
valueB
 *  @*
dtype0*
_output_shapes
: 
ė
pdnn/input_from_feature_columns/input_layer/old_defence_source/old_defence_source_normalize/clip_by_value/MinimumMinimumHdnn/input_from_feature_columns/input_layer/old_defence_source/ExpandDimsrdnn/input_from_feature_columns/input_layer/old_defence_source/old_defence_source_normalize/clip_by_value/Minimum/y*
T0*'
_output_shapes
:’’’’’’’’’
Æ
jdnn/input_from_feature_columns/input_layer/old_defence_source/old_defence_source_normalize/clip_by_value/yConst*
valueB
 *    *
dtype0*
_output_shapes
: 

hdnn/input_from_feature_columns/input_layer/old_defence_source/old_defence_source_normalize/clip_by_valueMaximumpdnn/input_from_feature_columns/input_layer/old_defence_source/old_defence_source_normalize/clip_by_value/Minimumjdnn/input_from_feature_columns/input_layer/old_defence_source/old_defence_source_normalize/clip_by_value/y*
T0*'
_output_shapes
:’’’’’’’’’
„
`dnn/input_from_feature_columns/input_layer/old_defence_source/old_defence_source_normalize/sub/yConst*
valueB
 *ā³ø?*
dtype0*
_output_shapes
: 
ć
^dnn/input_from_feature_columns/input_layer/old_defence_source/old_defence_source_normalize/subSubhdnn/input_from_feature_columns/input_layer/old_defence_source/old_defence_source_normalize/clip_by_value`dnn/input_from_feature_columns/input_layer/old_defence_source/old_defence_source_normalize/sub/y*
T0*'
_output_shapes
:’’’’’’’’’
©
ddnn/input_from_feature_columns/input_layer/old_defence_source/old_defence_source_normalize/truediv/yConst*
valueB
 *ÉS?*
dtype0*
_output_shapes
: 
å
bdnn/input_from_feature_columns/input_layer/old_defence_source/old_defence_source_normalize/truedivRealDiv^dnn/input_from_feature_columns/input_layer/old_defence_source/old_defence_source_normalize/subddnn/input_from_feature_columns/input_layer/old_defence_source/old_defence_source_normalize/truediv/y*
T0*'
_output_shapes
:’’’’’’’’’
Õ
Cdnn/input_from_feature_columns/input_layer/old_defence_source/ShapeShapebdnn/input_from_feature_columns/input_layer/old_defence_source/old_defence_source_normalize/truediv*
T0*
_output_shapes
:

Qdnn/input_from_feature_columns/input_layer/old_defence_source/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:

Sdnn/input_from_feature_columns/input_layer/old_defence_source/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:

Sdnn/input_from_feature_columns/input_layer/old_defence_source/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
ć
Kdnn/input_from_feature_columns/input_layer/old_defence_source/strided_sliceStridedSliceCdnn/input_from_feature_columns/input_layer/old_defence_source/ShapeQdnn/input_from_feature_columns/input_layer/old_defence_source/strided_slice/stackSdnn/input_from_feature_columns/input_layer/old_defence_source/strided_slice/stack_1Sdnn/input_from_feature_columns/input_layer/old_defence_source/strided_slice/stack_2*
shrink_axis_mask*
Index0*
T0*
_output_shapes
: 

Mdnn/input_from_feature_columns/input_layer/old_defence_source/Reshape/shape/1Const*
value	B :*
dtype0*
_output_shapes
: 

Kdnn/input_from_feature_columns/input_layer/old_defence_source/Reshape/shapePackKdnn/input_from_feature_columns/input_layer/old_defence_source/strided_sliceMdnn/input_from_feature_columns/input_layer/old_defence_source/Reshape/shape/1*
T0*
N*
_output_shapes
:
³
Ednn/input_from_feature_columns/input_layer/old_defence_source/ReshapeReshapebdnn/input_from_feature_columns/input_layer/old_defence_source/old_defence_source_normalize/truedivKdnn/input_from_feature_columns/input_layer/old_defence_source/Reshape/shape*
T0*'
_output_shapes
:’’’’’’’’’

Ldnn/input_from_feature_columns/input_layer/old_defence_target/ExpandDims/dimConst*
valueB :
’’’’’’’’’*
dtype0*
_output_shapes
: 
ź
Hdnn/input_from_feature_columns/input_layer/old_defence_target/ExpandDims
ExpandDimsold_defence_targetLdnn/input_from_feature_columns/input_layer/old_defence_target/ExpandDims/dim*
T0*'
_output_shapes
:’’’’’’’’’
·
rdnn/input_from_feature_columns/input_layer/old_defence_target/old_defence_target_normalize/clip_by_value/Minimum/yConst*
valueB
 *  @*
dtype0*
_output_shapes
: 
ė
pdnn/input_from_feature_columns/input_layer/old_defence_target/old_defence_target_normalize/clip_by_value/MinimumMinimumHdnn/input_from_feature_columns/input_layer/old_defence_target/ExpandDimsrdnn/input_from_feature_columns/input_layer/old_defence_target/old_defence_target_normalize/clip_by_value/Minimum/y*
T0*'
_output_shapes
:’’’’’’’’’
Æ
jdnn/input_from_feature_columns/input_layer/old_defence_target/old_defence_target_normalize/clip_by_value/yConst*
valueB
 *    *
dtype0*
_output_shapes
: 

hdnn/input_from_feature_columns/input_layer/old_defence_target/old_defence_target_normalize/clip_by_valueMaximumpdnn/input_from_feature_columns/input_layer/old_defence_target/old_defence_target_normalize/clip_by_value/Minimumjdnn/input_from_feature_columns/input_layer/old_defence_target/old_defence_target_normalize/clip_by_value/y*
T0*'
_output_shapes
:’’’’’’’’’
„
`dnn/input_from_feature_columns/input_layer/old_defence_target/old_defence_target_normalize/sub/yConst*
valueB
 *éŅ?*
dtype0*
_output_shapes
: 
ć
^dnn/input_from_feature_columns/input_layer/old_defence_target/old_defence_target_normalize/subSubhdnn/input_from_feature_columns/input_layer/old_defence_target/old_defence_target_normalize/clip_by_value`dnn/input_from_feature_columns/input_layer/old_defence_target/old_defence_target_normalize/sub/y*
T0*'
_output_shapes
:’’’’’’’’’
©
ddnn/input_from_feature_columns/input_layer/old_defence_target/old_defence_target_normalize/truediv/yConst*
valueB
 *÷AU?*
dtype0*
_output_shapes
: 
å
bdnn/input_from_feature_columns/input_layer/old_defence_target/old_defence_target_normalize/truedivRealDiv^dnn/input_from_feature_columns/input_layer/old_defence_target/old_defence_target_normalize/subddnn/input_from_feature_columns/input_layer/old_defence_target/old_defence_target_normalize/truediv/y*
T0*'
_output_shapes
:’’’’’’’’’
Õ
Cdnn/input_from_feature_columns/input_layer/old_defence_target/ShapeShapebdnn/input_from_feature_columns/input_layer/old_defence_target/old_defence_target_normalize/truediv*
T0*
_output_shapes
:

Qdnn/input_from_feature_columns/input_layer/old_defence_target/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:

Sdnn/input_from_feature_columns/input_layer/old_defence_target/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:

Sdnn/input_from_feature_columns/input_layer/old_defence_target/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
ć
Kdnn/input_from_feature_columns/input_layer/old_defence_target/strided_sliceStridedSliceCdnn/input_from_feature_columns/input_layer/old_defence_target/ShapeQdnn/input_from_feature_columns/input_layer/old_defence_target/strided_slice/stackSdnn/input_from_feature_columns/input_layer/old_defence_target/strided_slice/stack_1Sdnn/input_from_feature_columns/input_layer/old_defence_target/strided_slice/stack_2*
shrink_axis_mask*
Index0*
T0*
_output_shapes
: 

Mdnn/input_from_feature_columns/input_layer/old_defence_target/Reshape/shape/1Const*
value	B :*
dtype0*
_output_shapes
: 

Kdnn/input_from_feature_columns/input_layer/old_defence_target/Reshape/shapePackKdnn/input_from_feature_columns/input_layer/old_defence_target/strided_sliceMdnn/input_from_feature_columns/input_layer/old_defence_target/Reshape/shape/1*
T0*
N*
_output_shapes
:
³
Ednn/input_from_feature_columns/input_layer/old_defence_target/ReshapeReshapebdnn/input_from_feature_columns/input_layer/old_defence_target/old_defence_target_normalize/truedivKdnn/input_from_feature_columns/input_layer/old_defence_target/Reshape/shape*
T0*'
_output_shapes
:’’’’’’’’’

Gdnn/input_from_feature_columns/input_layer/old_hp_source/ExpandDims/dimConst*
valueB :
’’’’’’’’’*
dtype0*
_output_shapes
: 
Ū
Cdnn/input_from_feature_columns/input_layer/old_hp_source/ExpandDims
ExpandDimsold_hp_sourceGdnn/input_from_feature_columns/input_layer/old_hp_source/ExpandDims/dim*
T0*'
_output_shapes
:’’’’’’’’’
­
hdnn/input_from_feature_columns/input_layer/old_hp_source/old_hp_source_normalize/clip_by_value/Minimum/yConst*
valueB
 *  4B*
dtype0*
_output_shapes
: 
Ņ
fdnn/input_from_feature_columns/input_layer/old_hp_source/old_hp_source_normalize/clip_by_value/MinimumMinimumCdnn/input_from_feature_columns/input_layer/old_hp_source/ExpandDimshdnn/input_from_feature_columns/input_layer/old_hp_source/old_hp_source_normalize/clip_by_value/Minimum/y*
T0*'
_output_shapes
:’’’’’’’’’
„
`dnn/input_from_feature_columns/input_layer/old_hp_source/old_hp_source_normalize/clip_by_value/yConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
å
^dnn/input_from_feature_columns/input_layer/old_hp_source/old_hp_source_normalize/clip_by_valueMaximumfdnn/input_from_feature_columns/input_layer/old_hp_source/old_hp_source_normalize/clip_by_value/Minimum`dnn/input_from_feature_columns/input_layer/old_hp_source/old_hp_source_normalize/clip_by_value/y*
T0*'
_output_shapes
:’’’’’’’’’

Vdnn/input_from_feature_columns/input_layer/old_hp_source/old_hp_source_normalize/sub/yConst*
valueB
 *S)A*
dtype0*
_output_shapes
: 
Å
Tdnn/input_from_feature_columns/input_layer/old_hp_source/old_hp_source_normalize/subSub^dnn/input_from_feature_columns/input_layer/old_hp_source/old_hp_source_normalize/clip_by_valueVdnn/input_from_feature_columns/input_layer/old_hp_source/old_hp_source_normalize/sub/y*
T0*'
_output_shapes
:’’’’’’’’’

Zdnn/input_from_feature_columns/input_layer/old_hp_source/old_hp_source_normalize/truediv/yConst*
valueB
 *pŅ³@*
dtype0*
_output_shapes
: 
Ē
Xdnn/input_from_feature_columns/input_layer/old_hp_source/old_hp_source_normalize/truedivRealDivTdnn/input_from_feature_columns/input_layer/old_hp_source/old_hp_source_normalize/subZdnn/input_from_feature_columns/input_layer/old_hp_source/old_hp_source_normalize/truediv/y*
T0*'
_output_shapes
:’’’’’’’’’
Ę
>dnn/input_from_feature_columns/input_layer/old_hp_source/ShapeShapeXdnn/input_from_feature_columns/input_layer/old_hp_source/old_hp_source_normalize/truediv*
T0*
_output_shapes
:

Ldnn/input_from_feature_columns/input_layer/old_hp_source/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:

Ndnn/input_from_feature_columns/input_layer/old_hp_source/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:

Ndnn/input_from_feature_columns/input_layer/old_hp_source/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
Ź
Fdnn/input_from_feature_columns/input_layer/old_hp_source/strided_sliceStridedSlice>dnn/input_from_feature_columns/input_layer/old_hp_source/ShapeLdnn/input_from_feature_columns/input_layer/old_hp_source/strided_slice/stackNdnn/input_from_feature_columns/input_layer/old_hp_source/strided_slice/stack_1Ndnn/input_from_feature_columns/input_layer/old_hp_source/strided_slice/stack_2*
shrink_axis_mask*
Index0*
T0*
_output_shapes
: 

Hdnn/input_from_feature_columns/input_layer/old_hp_source/Reshape/shape/1Const*
value	B :*
dtype0*
_output_shapes
: 

Fdnn/input_from_feature_columns/input_layer/old_hp_source/Reshape/shapePackFdnn/input_from_feature_columns/input_layer/old_hp_source/strided_sliceHdnn/input_from_feature_columns/input_layer/old_hp_source/Reshape/shape/1*
T0*
N*
_output_shapes
:

@dnn/input_from_feature_columns/input_layer/old_hp_source/ReshapeReshapeXdnn/input_from_feature_columns/input_layer/old_hp_source/old_hp_source_normalize/truedivFdnn/input_from_feature_columns/input_layer/old_hp_source/Reshape/shape*
T0*'
_output_shapes
:’’’’’’’’’

Gdnn/input_from_feature_columns/input_layer/old_hp_target/ExpandDims/dimConst*
valueB :
’’’’’’’’’*
dtype0*
_output_shapes
: 
Ū
Cdnn/input_from_feature_columns/input_layer/old_hp_target/ExpandDims
ExpandDimsold_hp_targetGdnn/input_from_feature_columns/input_layer/old_hp_target/ExpandDims/dim*
T0*'
_output_shapes
:’’’’’’’’’
­
hdnn/input_from_feature_columns/input_layer/old_hp_target/old_hp_target_normalize/clip_by_value/Minimum/yConst*
valueB
 *  4B*
dtype0*
_output_shapes
: 
Ņ
fdnn/input_from_feature_columns/input_layer/old_hp_target/old_hp_target_normalize/clip_by_value/MinimumMinimumCdnn/input_from_feature_columns/input_layer/old_hp_target/ExpandDimshdnn/input_from_feature_columns/input_layer/old_hp_target/old_hp_target_normalize/clip_by_value/Minimum/y*
T0*'
_output_shapes
:’’’’’’’’’
„
`dnn/input_from_feature_columns/input_layer/old_hp_target/old_hp_target_normalize/clip_by_value/yConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
å
^dnn/input_from_feature_columns/input_layer/old_hp_target/old_hp_target_normalize/clip_by_valueMaximumfdnn/input_from_feature_columns/input_layer/old_hp_target/old_hp_target_normalize/clip_by_value/Minimum`dnn/input_from_feature_columns/input_layer/old_hp_target/old_hp_target_normalize/clip_by_value/y*
T0*'
_output_shapes
:’’’’’’’’’

Vdnn/input_from_feature_columns/input_layer/old_hp_target/old_hp_target_normalize/sub/yConst*
valueB
 *VēA*
dtype0*
_output_shapes
: 
Å
Tdnn/input_from_feature_columns/input_layer/old_hp_target/old_hp_target_normalize/subSub^dnn/input_from_feature_columns/input_layer/old_hp_target/old_hp_target_normalize/clip_by_valueVdnn/input_from_feature_columns/input_layer/old_hp_target/old_hp_target_normalize/sub/y*
T0*'
_output_shapes
:’’’’’’’’’

Zdnn/input_from_feature_columns/input_layer/old_hp_target/old_hp_target_normalize/truediv/yConst*
valueB
 *żh@*
dtype0*
_output_shapes
: 
Ē
Xdnn/input_from_feature_columns/input_layer/old_hp_target/old_hp_target_normalize/truedivRealDivTdnn/input_from_feature_columns/input_layer/old_hp_target/old_hp_target_normalize/subZdnn/input_from_feature_columns/input_layer/old_hp_target/old_hp_target_normalize/truediv/y*
T0*'
_output_shapes
:’’’’’’’’’
Ę
>dnn/input_from_feature_columns/input_layer/old_hp_target/ShapeShapeXdnn/input_from_feature_columns/input_layer/old_hp_target/old_hp_target_normalize/truediv*
T0*
_output_shapes
:

Ldnn/input_from_feature_columns/input_layer/old_hp_target/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:

Ndnn/input_from_feature_columns/input_layer/old_hp_target/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:

Ndnn/input_from_feature_columns/input_layer/old_hp_target/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
Ź
Fdnn/input_from_feature_columns/input_layer/old_hp_target/strided_sliceStridedSlice>dnn/input_from_feature_columns/input_layer/old_hp_target/ShapeLdnn/input_from_feature_columns/input_layer/old_hp_target/strided_slice/stackNdnn/input_from_feature_columns/input_layer/old_hp_target/strided_slice/stack_1Ndnn/input_from_feature_columns/input_layer/old_hp_target/strided_slice/stack_2*
shrink_axis_mask*
Index0*
T0*
_output_shapes
: 

Hdnn/input_from_feature_columns/input_layer/old_hp_target/Reshape/shape/1Const*
value	B :*
dtype0*
_output_shapes
: 

Fdnn/input_from_feature_columns/input_layer/old_hp_target/Reshape/shapePackFdnn/input_from_feature_columns/input_layer/old_hp_target/strided_sliceHdnn/input_from_feature_columns/input_layer/old_hp_target/Reshape/shape/1*
T0*
N*
_output_shapes
:

@dnn/input_from_feature_columns/input_layer/old_hp_target/ReshapeReshapeXdnn/input_from_feature_columns/input_layer/old_hp_target/old_hp_target_normalize/truedivFdnn/input_from_feature_columns/input_layer/old_hp_target/Reshape/shape*
T0*'
_output_shapes
:’’’’’’’’’

Ldnn/input_from_feature_columns/input_layer/old_terrain_source/ExpandDims/dimConst*
valueB :
’’’’’’’’’*
dtype0*
_output_shapes
: 
ģ
Hdnn/input_from_feature_columns/input_layer/old_terrain_source/ExpandDims
ExpandDimsold_terrain_source_1Ldnn/input_from_feature_columns/input_layer/old_terrain_source/ExpandDims/dim*
T0*'
_output_shapes
:’’’’’’’’’
»
Cdnn/input_from_feature_columns/input_layer/old_terrain_source/ShapeShapeHdnn/input_from_feature_columns/input_layer/old_terrain_source/ExpandDims*
T0*
_output_shapes
:

Qdnn/input_from_feature_columns/input_layer/old_terrain_source/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:

Sdnn/input_from_feature_columns/input_layer/old_terrain_source/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:

Sdnn/input_from_feature_columns/input_layer/old_terrain_source/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
ć
Kdnn/input_from_feature_columns/input_layer/old_terrain_source/strided_sliceStridedSliceCdnn/input_from_feature_columns/input_layer/old_terrain_source/ShapeQdnn/input_from_feature_columns/input_layer/old_terrain_source/strided_slice/stackSdnn/input_from_feature_columns/input_layer/old_terrain_source/strided_slice/stack_1Sdnn/input_from_feature_columns/input_layer/old_terrain_source/strided_slice/stack_2*
shrink_axis_mask*
Index0*
T0*
_output_shapes
: 

Mdnn/input_from_feature_columns/input_layer/old_terrain_source/Reshape/shape/1Const*
value	B :*
dtype0*
_output_shapes
: 

Kdnn/input_from_feature_columns/input_layer/old_terrain_source/Reshape/shapePackKdnn/input_from_feature_columns/input_layer/old_terrain_source/strided_sliceMdnn/input_from_feature_columns/input_layer/old_terrain_source/Reshape/shape/1*
T0*
N*
_output_shapes
:

Ednn/input_from_feature_columns/input_layer/old_terrain_source/ReshapeReshapeHdnn/input_from_feature_columns/input_layer/old_terrain_source/ExpandDimsKdnn/input_from_feature_columns/input_layer/old_terrain_source/Reshape/shape*
T0*'
_output_shapes
:’’’’’’’’’

Ldnn/input_from_feature_columns/input_layer/old_terrain_target/ExpandDims/dimConst*
valueB :
’’’’’’’’’*
dtype0*
_output_shapes
: 
ģ
Hdnn/input_from_feature_columns/input_layer/old_terrain_target/ExpandDims
ExpandDimsold_terrain_target_1Ldnn/input_from_feature_columns/input_layer/old_terrain_target/ExpandDims/dim*
T0*'
_output_shapes
:’’’’’’’’’
»
Cdnn/input_from_feature_columns/input_layer/old_terrain_target/ShapeShapeHdnn/input_from_feature_columns/input_layer/old_terrain_target/ExpandDims*
T0*
_output_shapes
:

Qdnn/input_from_feature_columns/input_layer/old_terrain_target/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:

Sdnn/input_from_feature_columns/input_layer/old_terrain_target/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:

Sdnn/input_from_feature_columns/input_layer/old_terrain_target/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
ć
Kdnn/input_from_feature_columns/input_layer/old_terrain_target/strided_sliceStridedSliceCdnn/input_from_feature_columns/input_layer/old_terrain_target/ShapeQdnn/input_from_feature_columns/input_layer/old_terrain_target/strided_slice/stackSdnn/input_from_feature_columns/input_layer/old_terrain_target/strided_slice/stack_1Sdnn/input_from_feature_columns/input_layer/old_terrain_target/strided_slice/stack_2*
shrink_axis_mask*
Index0*
T0*
_output_shapes
: 

Mdnn/input_from_feature_columns/input_layer/old_terrain_target/Reshape/shape/1Const*
value	B :*
dtype0*
_output_shapes
: 

Kdnn/input_from_feature_columns/input_layer/old_terrain_target/Reshape/shapePackKdnn/input_from_feature_columns/input_layer/old_terrain_target/strided_sliceMdnn/input_from_feature_columns/input_layer/old_terrain_target/Reshape/shape/1*
T0*
N*
_output_shapes
:

Ednn/input_from_feature_columns/input_layer/old_terrain_target/ReshapeReshapeHdnn/input_from_feature_columns/input_layer/old_terrain_target/ExpandDimsKdnn/input_from_feature_columns/input_layer/old_terrain_target/Reshape/shape*
T0*'
_output_shapes
:’’’’’’’’’

6dnn/input_from_feature_columns/input_layer/concat/axisConst*
valueB :
’’’’’’’’’*
dtype0*
_output_shapes
: 
Ü
1dnn/input_from_feature_columns/input_layer/concatConcatV2Ddnn/input_from_feature_columns/input_layer/old_attack_source/ReshapeDdnn/input_from_feature_columns/input_layer/old_attack_target/ReshapeEdnn/input_from_feature_columns/input_layer/old_defence_source/ReshapeEdnn/input_from_feature_columns/input_layer/old_defence_target/Reshape@dnn/input_from_feature_columns/input_layer/old_hp_source/Reshape@dnn/input_from_feature_columns/input_layer/old_hp_target/ReshapeEdnn/input_from_feature_columns/input_layer/old_terrain_source/ReshapeEdnn/input_from_feature_columns/input_layer/old_terrain_target/Reshape6dnn/input_from_feature_columns/input_layer/concat/axis*
T0*
N*'
_output_shapes
:’’’’’’’’’
Å
@dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/shapeConst*
valueB"      *2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
dtype0*
_output_shapes
:
·
>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/minConst*
valueB
 *AW¾*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
dtype0*
_output_shapes
: 
·
>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/maxConst*
valueB
 *AW>*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
dtype0*
_output_shapes
: 

Hdnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/RandomUniformRandomUniform@dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/shape*
T0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
dtype0*
_output_shapes
:	

>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/subSub>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/max>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/min*
T0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
_output_shapes
: 
­
>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/mulMulHdnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/RandomUniform>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/sub*
T0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
_output_shapes
:	

:dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniformAdd>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/mul>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/min*
T0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
_output_shapes
:	
Ļ
dnn/hiddenlayer_0/kernel/part_0VarHandleOp*
shape:	*0
shared_name!dnn/hiddenlayer_0/kernel/part_0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
dtype0*
_output_shapes
: 

@dnn/hiddenlayer_0/kernel/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_0/kernel/part_0*
_output_shapes
: 
Ų
&dnn/hiddenlayer_0/kernel/part_0/AssignAssignVariableOpdnn/hiddenlayer_0/kernel/part_0:dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
dtype0
Č
3dnn/hiddenlayer_0/kernel/part_0/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/kernel/part_0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
dtype0*
_output_shapes
:	
°
/dnn/hiddenlayer_0/bias/part_0/Initializer/zerosConst*
valueB*    *0
_class&
$"loc:@dnn/hiddenlayer_0/bias/part_0*
dtype0*
_output_shapes	
:
Å
dnn/hiddenlayer_0/bias/part_0VarHandleOp*
shape:*.
shared_namednn/hiddenlayer_0/bias/part_0*0
_class&
$"loc:@dnn/hiddenlayer_0/bias/part_0*
dtype0*
_output_shapes
: 

>dnn/hiddenlayer_0/bias/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_0/bias/part_0*
_output_shapes
: 
Ē
$dnn/hiddenlayer_0/bias/part_0/AssignAssignVariableOpdnn/hiddenlayer_0/bias/part_0/dnn/hiddenlayer_0/bias/part_0/Initializer/zeros*0
_class&
$"loc:@dnn/hiddenlayer_0/bias/part_0*
dtype0
¾
1dnn/hiddenlayer_0/bias/part_0/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/bias/part_0*0
_class&
$"loc:@dnn/hiddenlayer_0/bias/part_0*
dtype0*
_output_shapes	
:

'dnn/hiddenlayer_0/kernel/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/kernel/part_0*
dtype0*
_output_shapes
:	
w
dnn/hiddenlayer_0/kernelIdentity'dnn/hiddenlayer_0/kernel/ReadVariableOp*
T0*
_output_shapes
:	
¢
dnn/hiddenlayer_0/MatMulMatMul1dnn/input_from_feature_columns/input_layer/concatdnn/hiddenlayer_0/kernel*
T0*(
_output_shapes
:’’’’’’’’’

%dnn/hiddenlayer_0/bias/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/bias/part_0*
dtype0*
_output_shapes	
:
o
dnn/hiddenlayer_0/biasIdentity%dnn/hiddenlayer_0/bias/ReadVariableOp*
T0*
_output_shapes	
:

dnn/hiddenlayer_0/BiasAddBiasAdddnn/hiddenlayer_0/MatMuldnn/hiddenlayer_0/bias*
T0*(
_output_shapes
:’’’’’’’’’
l
dnn/hiddenlayer_0/ReluReludnn/hiddenlayer_0/BiasAdd*
T0*(
_output_shapes
:’’’’’’’’’
g
dnn/zero_fraction/SizeSizednn/hiddenlayer_0/Relu*
T0*
out_type0	*
_output_shapes
: 
c
dnn/zero_fraction/LessEqual/yConst*
valueB	 R’’’’*
dtype0	*
_output_shapes
: 

dnn/zero_fraction/LessEqual	LessEqualdnn/zero_fraction/Sizednn/zero_fraction/LessEqual/y*
T0	*
_output_shapes
: 

dnn/zero_fraction/cond/SwitchSwitchdnn/zero_fraction/LessEqualdnn/zero_fraction/LessEqual*
T0
*
_output_shapes
: : 
m
dnn/zero_fraction/cond/switch_tIdentitydnn/zero_fraction/cond/Switch:1*
T0
*
_output_shapes
: 
k
dnn/zero_fraction/cond/switch_fIdentitydnn/zero_fraction/cond/Switch*
T0
*
_output_shapes
: 
h
dnn/zero_fraction/cond/pred_idIdentitydnn/zero_fraction/LessEqual*
T0
*
_output_shapes
: 

*dnn/zero_fraction/cond/count_nonzero/zerosConst ^dnn/zero_fraction/cond/switch_t*
valueB
 *    *
dtype0*
_output_shapes
: 
Š
-dnn/zero_fraction/cond/count_nonzero/NotEqualNotEqual6dnn/zero_fraction/cond/count_nonzero/NotEqual/Switch:1*dnn/zero_fraction/cond/count_nonzero/zeros*
T0*(
_output_shapes
:’’’’’’’’’
č
4dnn/zero_fraction/cond/count_nonzero/NotEqual/SwitchSwitchdnn/hiddenlayer_0/Reludnn/zero_fraction/cond/pred_id*
T0*)
_class
loc:@dnn/hiddenlayer_0/Relu*<
_output_shapes*
(:’’’’’’’’’:’’’’’’’’’
¢
)dnn/zero_fraction/cond/count_nonzero/CastCast-dnn/zero_fraction/cond/count_nonzero/NotEqual*

SrcT0
*(
_output_shapes
:’’’’’’’’’*

DstT0

*dnn/zero_fraction/cond/count_nonzero/ConstConst ^dnn/zero_fraction/cond/switch_t*
valueB"       *
dtype0*
_output_shapes
:
±
2dnn/zero_fraction/cond/count_nonzero/nonzero_countSum)dnn/zero_fraction/cond/count_nonzero/Cast*dnn/zero_fraction/cond/count_nonzero/Const*
T0*
_output_shapes
: 

dnn/zero_fraction/cond/CastCast2dnn/zero_fraction/cond/count_nonzero/nonzero_count*

SrcT0*
_output_shapes
: *

DstT0	

,dnn/zero_fraction/cond/count_nonzero_1/zerosConst ^dnn/zero_fraction/cond/switch_f*
valueB
 *    *
dtype0*
_output_shapes
: 
Ō
/dnn/zero_fraction/cond/count_nonzero_1/NotEqualNotEqual6dnn/zero_fraction/cond/count_nonzero_1/NotEqual/Switch,dnn/zero_fraction/cond/count_nonzero_1/zeros*
T0*(
_output_shapes
:’’’’’’’’’
ź
6dnn/zero_fraction/cond/count_nonzero_1/NotEqual/SwitchSwitchdnn/hiddenlayer_0/Reludnn/zero_fraction/cond/pred_id*
T0*)
_class
loc:@dnn/hiddenlayer_0/Relu*<
_output_shapes*
(:’’’’’’’’’:’’’’’’’’’
¦
+dnn/zero_fraction/cond/count_nonzero_1/CastCast/dnn/zero_fraction/cond/count_nonzero_1/NotEqual*

SrcT0
*(
_output_shapes
:’’’’’’’’’*

DstT0	

,dnn/zero_fraction/cond/count_nonzero_1/ConstConst ^dnn/zero_fraction/cond/switch_f*
valueB"       *
dtype0*
_output_shapes
:
·
4dnn/zero_fraction/cond/count_nonzero_1/nonzero_countSum+dnn/zero_fraction/cond/count_nonzero_1/Cast,dnn/zero_fraction/cond/count_nonzero_1/Const*
T0	*
_output_shapes
: 
¤
dnn/zero_fraction/cond/MergeMerge4dnn/zero_fraction/cond/count_nonzero_1/nonzero_countdnn/zero_fraction/cond/Cast*
T0	*
N*
_output_shapes
: : 

(dnn/zero_fraction/counts_to_fraction/subSubdnn/zero_fraction/Sizednn/zero_fraction/cond/Merge*
T0	*
_output_shapes
: 

)dnn/zero_fraction/counts_to_fraction/CastCast(dnn/zero_fraction/counts_to_fraction/sub*

SrcT0	*
_output_shapes
: *

DstT0
{
+dnn/zero_fraction/counts_to_fraction/Cast_1Castdnn/zero_fraction/Size*

SrcT0	*
_output_shapes
: *

DstT0
°
,dnn/zero_fraction/counts_to_fraction/truedivRealDiv)dnn/zero_fraction/counts_to_fraction/Cast+dnn/zero_fraction/counts_to_fraction/Cast_1*
T0*
_output_shapes
: 
u
dnn/zero_fraction/fractionIdentity,dnn/zero_fraction/counts_to_fraction/truediv*
T0*
_output_shapes
: 
 
2dnn/dnn/hiddenlayer_0/fraction_of_zero_values/tagsConst*>
value5B3 B-dnn/dnn/hiddenlayer_0/fraction_of_zero_values*
dtype0*
_output_shapes
: 
Æ
-dnn/dnn/hiddenlayer_0/fraction_of_zero_valuesScalarSummary2dnn/dnn/hiddenlayer_0/fraction_of_zero_values/tagsdnn/zero_fraction/fraction*
T0*
_output_shapes
: 

$dnn/dnn/hiddenlayer_0/activation/tagConst*1
value(B& B dnn/dnn/hiddenlayer_0/activation*
dtype0*
_output_shapes
: 

 dnn/dnn/hiddenlayer_0/activationHistogramSummary$dnn/dnn/hiddenlayer_0/activation/tagdnn/hiddenlayer_0/Relu*
_output_shapes
: 
Å
@dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/shapeConst*
valueB"   @   *2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
dtype0*
_output_shapes
:
·
>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/minConst*
valueB
 *ó5¾*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
dtype0*
_output_shapes
: 
·
>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/maxConst*
valueB
 *ó5>*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
dtype0*
_output_shapes
: 

Hdnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/RandomUniformRandomUniform@dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/shape*
T0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
dtype0*
_output_shapes
:	@

>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/subSub>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/max>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/min*
T0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
_output_shapes
: 
­
>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/mulMulHdnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/RandomUniform>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/sub*
T0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
_output_shapes
:	@

:dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniformAdd>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/mul>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/min*
T0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
_output_shapes
:	@
Ļ
dnn/hiddenlayer_1/kernel/part_0VarHandleOp*
shape:	@*0
shared_name!dnn/hiddenlayer_1/kernel/part_0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
dtype0*
_output_shapes
: 

@dnn/hiddenlayer_1/kernel/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_1/kernel/part_0*
_output_shapes
: 
Ų
&dnn/hiddenlayer_1/kernel/part_0/AssignAssignVariableOpdnn/hiddenlayer_1/kernel/part_0:dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
dtype0
Č
3dnn/hiddenlayer_1/kernel/part_0/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/kernel/part_0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
dtype0*
_output_shapes
:	@
®
/dnn/hiddenlayer_1/bias/part_0/Initializer/zerosConst*
valueB@*    *0
_class&
$"loc:@dnn/hiddenlayer_1/bias/part_0*
dtype0*
_output_shapes
:@
Ä
dnn/hiddenlayer_1/bias/part_0VarHandleOp*
shape:@*.
shared_namednn/hiddenlayer_1/bias/part_0*0
_class&
$"loc:@dnn/hiddenlayer_1/bias/part_0*
dtype0*
_output_shapes
: 

>dnn/hiddenlayer_1/bias/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_1/bias/part_0*
_output_shapes
: 
Ē
$dnn/hiddenlayer_1/bias/part_0/AssignAssignVariableOpdnn/hiddenlayer_1/bias/part_0/dnn/hiddenlayer_1/bias/part_0/Initializer/zeros*0
_class&
$"loc:@dnn/hiddenlayer_1/bias/part_0*
dtype0
½
1dnn/hiddenlayer_1/bias/part_0/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/bias/part_0*0
_class&
$"loc:@dnn/hiddenlayer_1/bias/part_0*
dtype0*
_output_shapes
:@

'dnn/hiddenlayer_1/kernel/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/kernel/part_0*
dtype0*
_output_shapes
:	@
w
dnn/hiddenlayer_1/kernelIdentity'dnn/hiddenlayer_1/kernel/ReadVariableOp*
T0*
_output_shapes
:	@

dnn/hiddenlayer_1/MatMulMatMuldnn/hiddenlayer_0/Reludnn/hiddenlayer_1/kernel*
T0*'
_output_shapes
:’’’’’’’’’@

%dnn/hiddenlayer_1/bias/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/bias/part_0*
dtype0*
_output_shapes
:@
n
dnn/hiddenlayer_1/biasIdentity%dnn/hiddenlayer_1/bias/ReadVariableOp*
T0*
_output_shapes
:@

dnn/hiddenlayer_1/BiasAddBiasAdddnn/hiddenlayer_1/MatMuldnn/hiddenlayer_1/bias*
T0*'
_output_shapes
:’’’’’’’’’@
k
dnn/hiddenlayer_1/ReluReludnn/hiddenlayer_1/BiasAdd*
T0*'
_output_shapes
:’’’’’’’’’@
i
dnn/zero_fraction_1/SizeSizednn/hiddenlayer_1/Relu*
T0*
out_type0	*
_output_shapes
: 
e
dnn/zero_fraction_1/LessEqual/yConst*
valueB	 R’’’’*
dtype0	*
_output_shapes
: 

dnn/zero_fraction_1/LessEqual	LessEqualdnn/zero_fraction_1/Sizednn/zero_fraction_1/LessEqual/y*
T0	*
_output_shapes
: 

dnn/zero_fraction_1/cond/SwitchSwitchdnn/zero_fraction_1/LessEqualdnn/zero_fraction_1/LessEqual*
T0
*
_output_shapes
: : 
q
!dnn/zero_fraction_1/cond/switch_tIdentity!dnn/zero_fraction_1/cond/Switch:1*
T0
*
_output_shapes
: 
o
!dnn/zero_fraction_1/cond/switch_fIdentitydnn/zero_fraction_1/cond/Switch*
T0
*
_output_shapes
: 
l
 dnn/zero_fraction_1/cond/pred_idIdentitydnn/zero_fraction_1/LessEqual*
T0
*
_output_shapes
: 

,dnn/zero_fraction_1/cond/count_nonzero/zerosConst"^dnn/zero_fraction_1/cond/switch_t*
valueB
 *    *
dtype0*
_output_shapes
: 
Õ
/dnn/zero_fraction_1/cond/count_nonzero/NotEqualNotEqual8dnn/zero_fraction_1/cond/count_nonzero/NotEqual/Switch:1,dnn/zero_fraction_1/cond/count_nonzero/zeros*
T0*'
_output_shapes
:’’’’’’’’’@
ź
6dnn/zero_fraction_1/cond/count_nonzero/NotEqual/SwitchSwitchdnn/hiddenlayer_1/Relu dnn/zero_fraction_1/cond/pred_id*
T0*)
_class
loc:@dnn/hiddenlayer_1/Relu*:
_output_shapes(
&:’’’’’’’’’@:’’’’’’’’’@
„
+dnn/zero_fraction_1/cond/count_nonzero/CastCast/dnn/zero_fraction_1/cond/count_nonzero/NotEqual*

SrcT0
*'
_output_shapes
:’’’’’’’’’@*

DstT0
”
,dnn/zero_fraction_1/cond/count_nonzero/ConstConst"^dnn/zero_fraction_1/cond/switch_t*
valueB"       *
dtype0*
_output_shapes
:
·
4dnn/zero_fraction_1/cond/count_nonzero/nonzero_countSum+dnn/zero_fraction_1/cond/count_nonzero/Cast,dnn/zero_fraction_1/cond/count_nonzero/Const*
T0*
_output_shapes
: 

dnn/zero_fraction_1/cond/CastCast4dnn/zero_fraction_1/cond/count_nonzero/nonzero_count*

SrcT0*
_output_shapes
: *

DstT0	

.dnn/zero_fraction_1/cond/count_nonzero_1/zerosConst"^dnn/zero_fraction_1/cond/switch_f*
valueB
 *    *
dtype0*
_output_shapes
: 
Ł
1dnn/zero_fraction_1/cond/count_nonzero_1/NotEqualNotEqual8dnn/zero_fraction_1/cond/count_nonzero_1/NotEqual/Switch.dnn/zero_fraction_1/cond/count_nonzero_1/zeros*
T0*'
_output_shapes
:’’’’’’’’’@
ģ
8dnn/zero_fraction_1/cond/count_nonzero_1/NotEqual/SwitchSwitchdnn/hiddenlayer_1/Relu dnn/zero_fraction_1/cond/pred_id*
T0*)
_class
loc:@dnn/hiddenlayer_1/Relu*:
_output_shapes(
&:’’’’’’’’’@:’’’’’’’’’@
©
-dnn/zero_fraction_1/cond/count_nonzero_1/CastCast1dnn/zero_fraction_1/cond/count_nonzero_1/NotEqual*

SrcT0
*'
_output_shapes
:’’’’’’’’’@*

DstT0	
£
.dnn/zero_fraction_1/cond/count_nonzero_1/ConstConst"^dnn/zero_fraction_1/cond/switch_f*
valueB"       *
dtype0*
_output_shapes
:
½
6dnn/zero_fraction_1/cond/count_nonzero_1/nonzero_countSum-dnn/zero_fraction_1/cond/count_nonzero_1/Cast.dnn/zero_fraction_1/cond/count_nonzero_1/Const*
T0	*
_output_shapes
: 
Ŗ
dnn/zero_fraction_1/cond/MergeMerge6dnn/zero_fraction_1/cond/count_nonzero_1/nonzero_countdnn/zero_fraction_1/cond/Cast*
T0	*
N*
_output_shapes
: : 

*dnn/zero_fraction_1/counts_to_fraction/subSubdnn/zero_fraction_1/Sizednn/zero_fraction_1/cond/Merge*
T0	*
_output_shapes
: 

+dnn/zero_fraction_1/counts_to_fraction/CastCast*dnn/zero_fraction_1/counts_to_fraction/sub*

SrcT0	*
_output_shapes
: *

DstT0

-dnn/zero_fraction_1/counts_to_fraction/Cast_1Castdnn/zero_fraction_1/Size*

SrcT0	*
_output_shapes
: *

DstT0
¶
.dnn/zero_fraction_1/counts_to_fraction/truedivRealDiv+dnn/zero_fraction_1/counts_to_fraction/Cast-dnn/zero_fraction_1/counts_to_fraction/Cast_1*
T0*
_output_shapes
: 
y
dnn/zero_fraction_1/fractionIdentity.dnn/zero_fraction_1/counts_to_fraction/truediv*
T0*
_output_shapes
: 
 
2dnn/dnn/hiddenlayer_1/fraction_of_zero_values/tagsConst*>
value5B3 B-dnn/dnn/hiddenlayer_1/fraction_of_zero_values*
dtype0*
_output_shapes
: 
±
-dnn/dnn/hiddenlayer_1/fraction_of_zero_valuesScalarSummary2dnn/dnn/hiddenlayer_1/fraction_of_zero_values/tagsdnn/zero_fraction_1/fraction*
T0*
_output_shapes
: 

$dnn/dnn/hiddenlayer_1/activation/tagConst*1
value(B& B dnn/dnn/hiddenlayer_1/activation*
dtype0*
_output_shapes
: 

 dnn/dnn/hiddenlayer_1/activationHistogramSummary$dnn/dnn/hiddenlayer_1/activation/tagdnn/hiddenlayer_1/Relu*
_output_shapes
: 
Å
@dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/shapeConst*
valueB"@       *2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
dtype0*
_output_shapes
:
·
>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/minConst*
valueB
 *  ¾*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
dtype0*
_output_shapes
: 
·
>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/maxConst*
valueB
 *  >*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
dtype0*
_output_shapes
: 

Hdnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/RandomUniformRandomUniform@dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/shape*
T0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
dtype0*
_output_shapes

:@ 

>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/subSub>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/max>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/min*
T0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
_output_shapes
: 
¬
>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/mulMulHdnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/RandomUniform>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/sub*
T0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
_output_shapes

:@ 

:dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniformAdd>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/mul>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/min*
T0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
_output_shapes

:@ 
Ī
dnn/hiddenlayer_2/kernel/part_0VarHandleOp*
shape
:@ *0
shared_name!dnn/hiddenlayer_2/kernel/part_0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
dtype0*
_output_shapes
: 

@dnn/hiddenlayer_2/kernel/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_2/kernel/part_0*
_output_shapes
: 
Ų
&dnn/hiddenlayer_2/kernel/part_0/AssignAssignVariableOpdnn/hiddenlayer_2/kernel/part_0:dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
dtype0
Ē
3dnn/hiddenlayer_2/kernel/part_0/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/kernel/part_0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
dtype0*
_output_shapes

:@ 
®
/dnn/hiddenlayer_2/bias/part_0/Initializer/zerosConst*
valueB *    *0
_class&
$"loc:@dnn/hiddenlayer_2/bias/part_0*
dtype0*
_output_shapes
: 
Ä
dnn/hiddenlayer_2/bias/part_0VarHandleOp*
shape: *.
shared_namednn/hiddenlayer_2/bias/part_0*0
_class&
$"loc:@dnn/hiddenlayer_2/bias/part_0*
dtype0*
_output_shapes
: 

>dnn/hiddenlayer_2/bias/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_2/bias/part_0*
_output_shapes
: 
Ē
$dnn/hiddenlayer_2/bias/part_0/AssignAssignVariableOpdnn/hiddenlayer_2/bias/part_0/dnn/hiddenlayer_2/bias/part_0/Initializer/zeros*0
_class&
$"loc:@dnn/hiddenlayer_2/bias/part_0*
dtype0
½
1dnn/hiddenlayer_2/bias/part_0/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/bias/part_0*0
_class&
$"loc:@dnn/hiddenlayer_2/bias/part_0*
dtype0*
_output_shapes
: 

'dnn/hiddenlayer_2/kernel/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/kernel/part_0*
dtype0*
_output_shapes

:@ 
v
dnn/hiddenlayer_2/kernelIdentity'dnn/hiddenlayer_2/kernel/ReadVariableOp*
T0*
_output_shapes

:@ 

dnn/hiddenlayer_2/MatMulMatMuldnn/hiddenlayer_1/Reludnn/hiddenlayer_2/kernel*
T0*'
_output_shapes
:’’’’’’’’’ 

%dnn/hiddenlayer_2/bias/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/bias/part_0*
dtype0*
_output_shapes
: 
n
dnn/hiddenlayer_2/biasIdentity%dnn/hiddenlayer_2/bias/ReadVariableOp*
T0*
_output_shapes
: 

dnn/hiddenlayer_2/BiasAddBiasAdddnn/hiddenlayer_2/MatMuldnn/hiddenlayer_2/bias*
T0*'
_output_shapes
:’’’’’’’’’ 
k
dnn/hiddenlayer_2/ReluReludnn/hiddenlayer_2/BiasAdd*
T0*'
_output_shapes
:’’’’’’’’’ 
i
dnn/zero_fraction_2/SizeSizednn/hiddenlayer_2/Relu*
T0*
out_type0	*
_output_shapes
: 
e
dnn/zero_fraction_2/LessEqual/yConst*
valueB	 R’’’’*
dtype0	*
_output_shapes
: 

dnn/zero_fraction_2/LessEqual	LessEqualdnn/zero_fraction_2/Sizednn/zero_fraction_2/LessEqual/y*
T0	*
_output_shapes
: 

dnn/zero_fraction_2/cond/SwitchSwitchdnn/zero_fraction_2/LessEqualdnn/zero_fraction_2/LessEqual*
T0
*
_output_shapes
: : 
q
!dnn/zero_fraction_2/cond/switch_tIdentity!dnn/zero_fraction_2/cond/Switch:1*
T0
*
_output_shapes
: 
o
!dnn/zero_fraction_2/cond/switch_fIdentitydnn/zero_fraction_2/cond/Switch*
T0
*
_output_shapes
: 
l
 dnn/zero_fraction_2/cond/pred_idIdentitydnn/zero_fraction_2/LessEqual*
T0
*
_output_shapes
: 

,dnn/zero_fraction_2/cond/count_nonzero/zerosConst"^dnn/zero_fraction_2/cond/switch_t*
valueB
 *    *
dtype0*
_output_shapes
: 
Õ
/dnn/zero_fraction_2/cond/count_nonzero/NotEqualNotEqual8dnn/zero_fraction_2/cond/count_nonzero/NotEqual/Switch:1,dnn/zero_fraction_2/cond/count_nonzero/zeros*
T0*'
_output_shapes
:’’’’’’’’’ 
ź
6dnn/zero_fraction_2/cond/count_nonzero/NotEqual/SwitchSwitchdnn/hiddenlayer_2/Relu dnn/zero_fraction_2/cond/pred_id*
T0*)
_class
loc:@dnn/hiddenlayer_2/Relu*:
_output_shapes(
&:’’’’’’’’’ :’’’’’’’’’ 
„
+dnn/zero_fraction_2/cond/count_nonzero/CastCast/dnn/zero_fraction_2/cond/count_nonzero/NotEqual*

SrcT0
*'
_output_shapes
:’’’’’’’’’ *

DstT0
”
,dnn/zero_fraction_2/cond/count_nonzero/ConstConst"^dnn/zero_fraction_2/cond/switch_t*
valueB"       *
dtype0*
_output_shapes
:
·
4dnn/zero_fraction_2/cond/count_nonzero/nonzero_countSum+dnn/zero_fraction_2/cond/count_nonzero/Cast,dnn/zero_fraction_2/cond/count_nonzero/Const*
T0*
_output_shapes
: 

dnn/zero_fraction_2/cond/CastCast4dnn/zero_fraction_2/cond/count_nonzero/nonzero_count*

SrcT0*
_output_shapes
: *

DstT0	

.dnn/zero_fraction_2/cond/count_nonzero_1/zerosConst"^dnn/zero_fraction_2/cond/switch_f*
valueB
 *    *
dtype0*
_output_shapes
: 
Ł
1dnn/zero_fraction_2/cond/count_nonzero_1/NotEqualNotEqual8dnn/zero_fraction_2/cond/count_nonzero_1/NotEqual/Switch.dnn/zero_fraction_2/cond/count_nonzero_1/zeros*
T0*'
_output_shapes
:’’’’’’’’’ 
ģ
8dnn/zero_fraction_2/cond/count_nonzero_1/NotEqual/SwitchSwitchdnn/hiddenlayer_2/Relu dnn/zero_fraction_2/cond/pred_id*
T0*)
_class
loc:@dnn/hiddenlayer_2/Relu*:
_output_shapes(
&:’’’’’’’’’ :’’’’’’’’’ 
©
-dnn/zero_fraction_2/cond/count_nonzero_1/CastCast1dnn/zero_fraction_2/cond/count_nonzero_1/NotEqual*

SrcT0
*'
_output_shapes
:’’’’’’’’’ *

DstT0	
£
.dnn/zero_fraction_2/cond/count_nonzero_1/ConstConst"^dnn/zero_fraction_2/cond/switch_f*
valueB"       *
dtype0*
_output_shapes
:
½
6dnn/zero_fraction_2/cond/count_nonzero_1/nonzero_countSum-dnn/zero_fraction_2/cond/count_nonzero_1/Cast.dnn/zero_fraction_2/cond/count_nonzero_1/Const*
T0	*
_output_shapes
: 
Ŗ
dnn/zero_fraction_2/cond/MergeMerge6dnn/zero_fraction_2/cond/count_nonzero_1/nonzero_countdnn/zero_fraction_2/cond/Cast*
T0	*
N*
_output_shapes
: : 

*dnn/zero_fraction_2/counts_to_fraction/subSubdnn/zero_fraction_2/Sizednn/zero_fraction_2/cond/Merge*
T0	*
_output_shapes
: 

+dnn/zero_fraction_2/counts_to_fraction/CastCast*dnn/zero_fraction_2/counts_to_fraction/sub*

SrcT0	*
_output_shapes
: *

DstT0

-dnn/zero_fraction_2/counts_to_fraction/Cast_1Castdnn/zero_fraction_2/Size*

SrcT0	*
_output_shapes
: *

DstT0
¶
.dnn/zero_fraction_2/counts_to_fraction/truedivRealDiv+dnn/zero_fraction_2/counts_to_fraction/Cast-dnn/zero_fraction_2/counts_to_fraction/Cast_1*
T0*
_output_shapes
: 
y
dnn/zero_fraction_2/fractionIdentity.dnn/zero_fraction_2/counts_to_fraction/truediv*
T0*
_output_shapes
: 
 
2dnn/dnn/hiddenlayer_2/fraction_of_zero_values/tagsConst*>
value5B3 B-dnn/dnn/hiddenlayer_2/fraction_of_zero_values*
dtype0*
_output_shapes
: 
±
-dnn/dnn/hiddenlayer_2/fraction_of_zero_valuesScalarSummary2dnn/dnn/hiddenlayer_2/fraction_of_zero_values/tagsdnn/zero_fraction_2/fraction*
T0*
_output_shapes
: 

$dnn/dnn/hiddenlayer_2/activation/tagConst*1
value(B& B dnn/dnn/hiddenlayer_2/activation*
dtype0*
_output_shapes
: 

 dnn/dnn/hiddenlayer_2/activationHistogramSummary$dnn/dnn/hiddenlayer_2/activation/tagdnn/hiddenlayer_2/Relu*
_output_shapes
: 
·
9dnn/logits/kernel/part_0/Initializer/random_uniform/shapeConst*
valueB"       *+
_class!
loc:@dnn/logits/kernel/part_0*
dtype0*
_output_shapes
:
©
7dnn/logits/kernel/part_0/Initializer/random_uniform/minConst*
valueB
 *A×¾*+
_class!
loc:@dnn/logits/kernel/part_0*
dtype0*
_output_shapes
: 
©
7dnn/logits/kernel/part_0/Initializer/random_uniform/maxConst*
valueB
 *A×>*+
_class!
loc:@dnn/logits/kernel/part_0*
dtype0*
_output_shapes
: 
š
Adnn/logits/kernel/part_0/Initializer/random_uniform/RandomUniformRandomUniform9dnn/logits/kernel/part_0/Initializer/random_uniform/shape*
T0*+
_class!
loc:@dnn/logits/kernel/part_0*
dtype0*
_output_shapes

: 
ž
7dnn/logits/kernel/part_0/Initializer/random_uniform/subSub7dnn/logits/kernel/part_0/Initializer/random_uniform/max7dnn/logits/kernel/part_0/Initializer/random_uniform/min*
T0*+
_class!
loc:@dnn/logits/kernel/part_0*
_output_shapes
: 

7dnn/logits/kernel/part_0/Initializer/random_uniform/mulMulAdnn/logits/kernel/part_0/Initializer/random_uniform/RandomUniform7dnn/logits/kernel/part_0/Initializer/random_uniform/sub*
T0*+
_class!
loc:@dnn/logits/kernel/part_0*
_output_shapes

: 

3dnn/logits/kernel/part_0/Initializer/random_uniformAdd7dnn/logits/kernel/part_0/Initializer/random_uniform/mul7dnn/logits/kernel/part_0/Initializer/random_uniform/min*
T0*+
_class!
loc:@dnn/logits/kernel/part_0*
_output_shapes

: 
¹
dnn/logits/kernel/part_0VarHandleOp*
shape
: *)
shared_namednn/logits/kernel/part_0*+
_class!
loc:@dnn/logits/kernel/part_0*
dtype0*
_output_shapes
: 

9dnn/logits/kernel/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/logits/kernel/part_0*
_output_shapes
: 
¼
dnn/logits/kernel/part_0/AssignAssignVariableOpdnn/logits/kernel/part_03dnn/logits/kernel/part_0/Initializer/random_uniform*+
_class!
loc:@dnn/logits/kernel/part_0*
dtype0
²
,dnn/logits/kernel/part_0/Read/ReadVariableOpReadVariableOpdnn/logits/kernel/part_0*+
_class!
loc:@dnn/logits/kernel/part_0*
dtype0*
_output_shapes

: 
 
(dnn/logits/bias/part_0/Initializer/zerosConst*
valueB*    *)
_class
loc:@dnn/logits/bias/part_0*
dtype0*
_output_shapes
:
Æ
dnn/logits/bias/part_0VarHandleOp*
shape:*'
shared_namednn/logits/bias/part_0*)
_class
loc:@dnn/logits/bias/part_0*
dtype0*
_output_shapes
: 
}
7dnn/logits/bias/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/logits/bias/part_0*
_output_shapes
: 
«
dnn/logits/bias/part_0/AssignAssignVariableOpdnn/logits/bias/part_0(dnn/logits/bias/part_0/Initializer/zeros*)
_class
loc:@dnn/logits/bias/part_0*
dtype0
Ø
*dnn/logits/bias/part_0/Read/ReadVariableOpReadVariableOpdnn/logits/bias/part_0*)
_class
loc:@dnn/logits/bias/part_0*
dtype0*
_output_shapes
:
y
 dnn/logits/kernel/ReadVariableOpReadVariableOpdnn/logits/kernel/part_0*
dtype0*
_output_shapes

: 
h
dnn/logits/kernelIdentity dnn/logits/kernel/ReadVariableOp*
T0*
_output_shapes

: 
x
dnn/logits/MatMulMatMuldnn/hiddenlayer_2/Reludnn/logits/kernel*
T0*'
_output_shapes
:’’’’’’’’’
q
dnn/logits/bias/ReadVariableOpReadVariableOpdnn/logits/bias/part_0*
dtype0*
_output_shapes
:
`
dnn/logits/biasIdentitydnn/logits/bias/ReadVariableOp*
T0*
_output_shapes
:
s
dnn/logits/BiasAddBiasAdddnn/logits/MatMuldnn/logits/bias*
T0*'
_output_shapes
:’’’’’’’’’
e
dnn/zero_fraction_3/SizeSizednn/logits/BiasAdd*
T0*
out_type0	*
_output_shapes
: 
e
dnn/zero_fraction_3/LessEqual/yConst*
valueB	 R’’’’*
dtype0	*
_output_shapes
: 

dnn/zero_fraction_3/LessEqual	LessEqualdnn/zero_fraction_3/Sizednn/zero_fraction_3/LessEqual/y*
T0	*
_output_shapes
: 

dnn/zero_fraction_3/cond/SwitchSwitchdnn/zero_fraction_3/LessEqualdnn/zero_fraction_3/LessEqual*
T0
*
_output_shapes
: : 
q
!dnn/zero_fraction_3/cond/switch_tIdentity!dnn/zero_fraction_3/cond/Switch:1*
T0
*
_output_shapes
: 
o
!dnn/zero_fraction_3/cond/switch_fIdentitydnn/zero_fraction_3/cond/Switch*
T0
*
_output_shapes
: 
l
 dnn/zero_fraction_3/cond/pred_idIdentitydnn/zero_fraction_3/LessEqual*
T0
*
_output_shapes
: 

,dnn/zero_fraction_3/cond/count_nonzero/zerosConst"^dnn/zero_fraction_3/cond/switch_t*
valueB
 *    *
dtype0*
_output_shapes
: 
Õ
/dnn/zero_fraction_3/cond/count_nonzero/NotEqualNotEqual8dnn/zero_fraction_3/cond/count_nonzero/NotEqual/Switch:1,dnn/zero_fraction_3/cond/count_nonzero/zeros*
T0*'
_output_shapes
:’’’’’’’’’
ā
6dnn/zero_fraction_3/cond/count_nonzero/NotEqual/SwitchSwitchdnn/logits/BiasAdd dnn/zero_fraction_3/cond/pred_id*
T0*%
_class
loc:@dnn/logits/BiasAdd*:
_output_shapes(
&:’’’’’’’’’:’’’’’’’’’
„
+dnn/zero_fraction_3/cond/count_nonzero/CastCast/dnn/zero_fraction_3/cond/count_nonzero/NotEqual*

SrcT0
*'
_output_shapes
:’’’’’’’’’*

DstT0
”
,dnn/zero_fraction_3/cond/count_nonzero/ConstConst"^dnn/zero_fraction_3/cond/switch_t*
valueB"       *
dtype0*
_output_shapes
:
·
4dnn/zero_fraction_3/cond/count_nonzero/nonzero_countSum+dnn/zero_fraction_3/cond/count_nonzero/Cast,dnn/zero_fraction_3/cond/count_nonzero/Const*
T0*
_output_shapes
: 

dnn/zero_fraction_3/cond/CastCast4dnn/zero_fraction_3/cond/count_nonzero/nonzero_count*

SrcT0*
_output_shapes
: *

DstT0	

.dnn/zero_fraction_3/cond/count_nonzero_1/zerosConst"^dnn/zero_fraction_3/cond/switch_f*
valueB
 *    *
dtype0*
_output_shapes
: 
Ł
1dnn/zero_fraction_3/cond/count_nonzero_1/NotEqualNotEqual8dnn/zero_fraction_3/cond/count_nonzero_1/NotEqual/Switch.dnn/zero_fraction_3/cond/count_nonzero_1/zeros*
T0*'
_output_shapes
:’’’’’’’’’
ä
8dnn/zero_fraction_3/cond/count_nonzero_1/NotEqual/SwitchSwitchdnn/logits/BiasAdd dnn/zero_fraction_3/cond/pred_id*
T0*%
_class
loc:@dnn/logits/BiasAdd*:
_output_shapes(
&:’’’’’’’’’:’’’’’’’’’
©
-dnn/zero_fraction_3/cond/count_nonzero_1/CastCast1dnn/zero_fraction_3/cond/count_nonzero_1/NotEqual*

SrcT0
*'
_output_shapes
:’’’’’’’’’*

DstT0	
£
.dnn/zero_fraction_3/cond/count_nonzero_1/ConstConst"^dnn/zero_fraction_3/cond/switch_f*
valueB"       *
dtype0*
_output_shapes
:
½
6dnn/zero_fraction_3/cond/count_nonzero_1/nonzero_countSum-dnn/zero_fraction_3/cond/count_nonzero_1/Cast.dnn/zero_fraction_3/cond/count_nonzero_1/Const*
T0	*
_output_shapes
: 
Ŗ
dnn/zero_fraction_3/cond/MergeMerge6dnn/zero_fraction_3/cond/count_nonzero_1/nonzero_countdnn/zero_fraction_3/cond/Cast*
T0	*
N*
_output_shapes
: : 

*dnn/zero_fraction_3/counts_to_fraction/subSubdnn/zero_fraction_3/Sizednn/zero_fraction_3/cond/Merge*
T0	*
_output_shapes
: 

+dnn/zero_fraction_3/counts_to_fraction/CastCast*dnn/zero_fraction_3/counts_to_fraction/sub*

SrcT0	*
_output_shapes
: *

DstT0

-dnn/zero_fraction_3/counts_to_fraction/Cast_1Castdnn/zero_fraction_3/Size*

SrcT0	*
_output_shapes
: *

DstT0
¶
.dnn/zero_fraction_3/counts_to_fraction/truedivRealDiv+dnn/zero_fraction_3/counts_to_fraction/Cast-dnn/zero_fraction_3/counts_to_fraction/Cast_1*
T0*
_output_shapes
: 
y
dnn/zero_fraction_3/fractionIdentity.dnn/zero_fraction_3/counts_to_fraction/truediv*
T0*
_output_shapes
: 

+dnn/dnn/logits/fraction_of_zero_values/tagsConst*7
value.B, B&dnn/dnn/logits/fraction_of_zero_values*
dtype0*
_output_shapes
: 
£
&dnn/dnn/logits/fraction_of_zero_valuesScalarSummary+dnn/dnn/logits/fraction_of_zero_values/tagsdnn/zero_fraction_3/fraction*
T0*
_output_shapes
: 
w
dnn/dnn/logits/activation/tagConst**
value!B Bdnn/dnn/logits/activation*
dtype0*
_output_shapes
: 
x
dnn/dnn/logits/activationHistogramSummarydnn/dnn/logits/activation/tagdnn/logits/BiasAdd*
_output_shapes
: 
W
dnn/head/logits/ShapeShapednn/logits/BiasAdd*
T0*
_output_shapes
:
k
)dnn/head/logits/assert_rank_at_least/rankConst*
value	B :*
dtype0*
_output_shapes
: 
[
Sdnn/head/logits/assert_rank_at_least/assert_type/statically_determined_correct_typeNoOp
L
Ddnn/head/logits/assert_rank_at_least/static_checks_determined_all_okNoOp

initNoOp

init_all_tablesNoOp

init_1NoOp
4

group_depsNoOp^init^init_1^init_all_tables
Y
save/filename/inputConst*
valueB Bmodel*
dtype0*
_output_shapes
: 
n
save/filenamePlaceholderWithDefaultsave/filename/input*
shape: *
dtype0*
_output_shapes
: 
e

save/ConstPlaceholderWithDefaultsave/filename*
shape: *
dtype0*
_output_shapes
: 
s
save/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/bias/part_0*
dtype0*
_output_shapes	
:
Y
save/IdentityIdentitysave/Read/ReadVariableOp*
T0*
_output_shapes	
:
_
save/Identity_1Identitysave/Identity"/device:CPU:0*
T0*
_output_shapes	
:
{
save/Read_1/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/kernel/part_0*
dtype0*
_output_shapes
:	
a
save/Identity_2Identitysave/Read_1/ReadVariableOp*
T0*
_output_shapes
:	
e
save/Identity_3Identitysave/Identity_2"/device:CPU:0*
T0*
_output_shapes
:	
t
save/Read_2/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/bias/part_0*
dtype0*
_output_shapes
:@
\
save/Identity_4Identitysave/Read_2/ReadVariableOp*
T0*
_output_shapes
:@
`
save/Identity_5Identitysave/Identity_4"/device:CPU:0*
T0*
_output_shapes
:@
{
save/Read_3/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/kernel/part_0*
dtype0*
_output_shapes
:	@
a
save/Identity_6Identitysave/Read_3/ReadVariableOp*
T0*
_output_shapes
:	@
e
save/Identity_7Identitysave/Identity_6"/device:CPU:0*
T0*
_output_shapes
:	@
t
save/Read_4/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/bias/part_0*
dtype0*
_output_shapes
: 
\
save/Identity_8Identitysave/Read_4/ReadVariableOp*
T0*
_output_shapes
: 
`
save/Identity_9Identitysave/Identity_8"/device:CPU:0*
T0*
_output_shapes
: 
z
save/Read_5/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/kernel/part_0*
dtype0*
_output_shapes

:@ 
a
save/Identity_10Identitysave/Read_5/ReadVariableOp*
T0*
_output_shapes

:@ 
f
save/Identity_11Identitysave/Identity_10"/device:CPU:0*
T0*
_output_shapes

:@ 
m
save/Read_6/ReadVariableOpReadVariableOpdnn/logits/bias/part_0*
dtype0*
_output_shapes
:
]
save/Identity_12Identitysave/Read_6/ReadVariableOp*
T0*
_output_shapes
:
b
save/Identity_13Identitysave/Identity_12"/device:CPU:0*
T0*
_output_shapes
:
s
save/Read_7/ReadVariableOpReadVariableOpdnn/logits/kernel/part_0*
dtype0*
_output_shapes

: 
a
save/Identity_14Identitysave/Read_7/ReadVariableOp*
T0*
_output_shapes

: 
f
save/Identity_15Identitysave/Identity_14"/device:CPU:0*
T0*
_output_shapes

: 

save/StringJoin/inputs_1Const*<
value3B1 B+_temp_eaf5e7d6dfa547a994880ac8d292ddf7/part*
dtype0*
_output_shapes
: 
d
save/StringJoin
StringJoin
save/Constsave/StringJoin/inputs_1*
N*
_output_shapes
: 
Q
save/num_shardsConst*
value	B :*
dtype0*
_output_shapes
: 
k
save/ShardedFilename/shardConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 

save/ShardedFilenameShardedFilenamesave/StringJoinsave/ShardedFilename/shardsave/num_shards"/device:CPU:0*
_output_shapes
: 
{
save/SaveV2/tensor_namesConst"/device:CPU:0* 
valueBBglobal_step*
dtype0*
_output_shapes
:
t
save/SaveV2/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:

save/SaveV2SaveV2save/ShardedFilenamesave/SaveV2/tensor_namessave/SaveV2/shape_and_slicesglobal_step"/device:CPU:0*
dtypes
2	
 
save/control_dependencyIdentitysave/ShardedFilename^save/SaveV2"/device:CPU:0*
T0*'
_class
loc:@save/ShardedFilename*
_output_shapes
: 
m
save/ShardedFilename_1/shardConst"/device:CPU:0*
value	B :*
dtype0*
_output_shapes
: 

save/ShardedFilename_1ShardedFilenamesave/StringJoinsave/ShardedFilename_1/shardsave/num_shards"/device:CPU:0*
_output_shapes
: 

save/Read_8/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/bias/part_0"/device:CPU:0*
dtype0*
_output_shapes	
:
m
save/Identity_16Identitysave/Read_8/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes	
:
c
save/Identity_17Identitysave/Identity_16"/device:CPU:0*
T0*
_output_shapes	
:

save/Read_9/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/kernel/part_0"/device:CPU:0*
dtype0*
_output_shapes
:	
q
save/Identity_18Identitysave/Read_9/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes
:	
g
save/Identity_19Identitysave/Identity_18"/device:CPU:0*
T0*
_output_shapes
:	

save/Read_10/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/bias/part_0"/device:CPU:0*
dtype0*
_output_shapes
:@
m
save/Identity_20Identitysave/Read_10/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes
:@
b
save/Identity_21Identitysave/Identity_20"/device:CPU:0*
T0*
_output_shapes
:@

save/Read_11/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/kernel/part_0"/device:CPU:0*
dtype0*
_output_shapes
:	@
r
save/Identity_22Identitysave/Read_11/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes
:	@
g
save/Identity_23Identitysave/Identity_22"/device:CPU:0*
T0*
_output_shapes
:	@

save/Read_12/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/bias/part_0"/device:CPU:0*
dtype0*
_output_shapes
: 
m
save/Identity_24Identitysave/Read_12/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes
: 
b
save/Identity_25Identitysave/Identity_24"/device:CPU:0*
T0*
_output_shapes
: 

save/Read_13/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/kernel/part_0"/device:CPU:0*
dtype0*
_output_shapes

:@ 
q
save/Identity_26Identitysave/Read_13/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes

:@ 
f
save/Identity_27Identitysave/Identity_26"/device:CPU:0*
T0*
_output_shapes

:@ 
}
save/Read_14/ReadVariableOpReadVariableOpdnn/logits/bias/part_0"/device:CPU:0*
dtype0*
_output_shapes
:
m
save/Identity_28Identitysave/Read_14/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes
:
b
save/Identity_29Identitysave/Identity_28"/device:CPU:0*
T0*
_output_shapes
:

save/Read_15/ReadVariableOpReadVariableOpdnn/logits/kernel/part_0"/device:CPU:0*
dtype0*
_output_shapes

: 
q
save/Identity_30Identitysave/Read_15/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes

: 
f
save/Identity_31Identitysave/Identity_30"/device:CPU:0*
T0*
_output_shapes

: 
­
save/SaveV2_1/tensor_namesConst"/device:CPU:0*Ļ
valueÅBĀBdnn/hiddenlayer_0/biasBdnn/hiddenlayer_0/kernelBdnn/hiddenlayer_1/biasBdnn/hiddenlayer_1/kernelBdnn/hiddenlayer_2/biasBdnn/hiddenlayer_2/kernelBdnn/logits/biasBdnn/logits/kernel*
dtype0*
_output_shapes
:
Ü
save/SaveV2_1/shape_and_slicesConst"/device:CPU:0*{
valuerBpB	128 0,128B8 128 0,8:0,128B64 0,64B128 64 0,128:0,64B32 0,32B64 32 0,64:0,32B2 0,2B32 2 0,32:0,2*
dtype0*
_output_shapes
:
¢
save/SaveV2_1SaveV2save/ShardedFilename_1save/SaveV2_1/tensor_namessave/SaveV2_1/shape_and_slicessave/Identity_17save/Identity_19save/Identity_21save/Identity_23save/Identity_25save/Identity_27save/Identity_29save/Identity_31"/device:CPU:0*
dtypes

2
Ø
save/control_dependency_1Identitysave/ShardedFilename_1^save/SaveV2_1"/device:CPU:0*
T0*)
_class
loc:@save/ShardedFilename_1*
_output_shapes
: 
Ō
+save/MergeV2Checkpoints/checkpoint_prefixesPacksave/ShardedFilenamesave/ShardedFilename_1^save/control_dependency^save/control_dependency_1"/device:CPU:0*
T0*
N*
_output_shapes
:
u
save/MergeV2CheckpointsMergeV2Checkpoints+save/MergeV2Checkpoints/checkpoint_prefixes
save/Const"/device:CPU:0
Ø
save/Identity_32Identity
save/Const^save/MergeV2Checkpoints^save/control_dependency^save/control_dependency_1"/device:CPU:0*
T0*
_output_shapes
: 
~
save/RestoreV2/tensor_namesConst"/device:CPU:0* 
valueBBglobal_step*
dtype0*
_output_shapes
:
w
save/RestoreV2/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:

save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices"/device:CPU:0*
dtypes
2	*
_output_shapes
:
s
save/AssignAssignglobal_stepsave/RestoreV2*
T0	*
_class
loc:@global_step*
_output_shapes
: 
(
save/restore_shardNoOp^save/Assign
°
save/RestoreV2_1/tensor_namesConst"/device:CPU:0*Ļ
valueÅBĀBdnn/hiddenlayer_0/biasBdnn/hiddenlayer_0/kernelBdnn/hiddenlayer_1/biasBdnn/hiddenlayer_1/kernelBdnn/hiddenlayer_2/biasBdnn/hiddenlayer_2/kernelBdnn/logits/biasBdnn/logits/kernel*
dtype0*
_output_shapes
:
ß
!save/RestoreV2_1/shape_and_slicesConst"/device:CPU:0*{
valuerBpB	128 0,128B8 128 0,8:0,128B64 0,64B128 64 0,128:0,64B32 0,32B64 32 0,64:0,32B2 0,2B32 2 0,32:0,2*
dtype0*
_output_shapes
:
ė
save/RestoreV2_1	RestoreV2
save/Constsave/RestoreV2_1/tensor_names!save/RestoreV2_1/shape_and_slices"/device:CPU:0*
dtypes

2*W
_output_shapesE
C::	:@:	@: :@ :: 
c
save/Identity_33Identitysave/RestoreV2_1"/device:CPU:0*
T0*
_output_shapes	
:
v
save/AssignVariableOpAssignVariableOpdnn/hiddenlayer_0/bias/part_0save/Identity_33"/device:CPU:0*
dtype0
i
save/Identity_34Identitysave/RestoreV2_1:1"/device:CPU:0*
T0*
_output_shapes
:	
z
save/AssignVariableOp_1AssignVariableOpdnn/hiddenlayer_0/kernel/part_0save/Identity_34"/device:CPU:0*
dtype0
d
save/Identity_35Identitysave/RestoreV2_1:2"/device:CPU:0*
T0*
_output_shapes
:@
x
save/AssignVariableOp_2AssignVariableOpdnn/hiddenlayer_1/bias/part_0save/Identity_35"/device:CPU:0*
dtype0
i
save/Identity_36Identitysave/RestoreV2_1:3"/device:CPU:0*
T0*
_output_shapes
:	@
z
save/AssignVariableOp_3AssignVariableOpdnn/hiddenlayer_1/kernel/part_0save/Identity_36"/device:CPU:0*
dtype0
d
save/Identity_37Identitysave/RestoreV2_1:4"/device:CPU:0*
T0*
_output_shapes
: 
x
save/AssignVariableOp_4AssignVariableOpdnn/hiddenlayer_2/bias/part_0save/Identity_37"/device:CPU:0*
dtype0
h
save/Identity_38Identitysave/RestoreV2_1:5"/device:CPU:0*
T0*
_output_shapes

:@ 
z
save/AssignVariableOp_5AssignVariableOpdnn/hiddenlayer_2/kernel/part_0save/Identity_38"/device:CPU:0*
dtype0
d
save/Identity_39Identitysave/RestoreV2_1:6"/device:CPU:0*
T0*
_output_shapes
:
q
save/AssignVariableOp_6AssignVariableOpdnn/logits/bias/part_0save/Identity_39"/device:CPU:0*
dtype0
h
save/Identity_40Identitysave/RestoreV2_1:7"/device:CPU:0*
T0*
_output_shapes

: 
s
save/AssignVariableOp_7AssignVariableOpdnn/logits/kernel/part_0save/Identity_40"/device:CPU:0*
dtype0
ł
save/restore_shard_1NoOp^save/AssignVariableOp^save/AssignVariableOp_1^save/AssignVariableOp_2^save/AssignVariableOp_3^save/AssignVariableOp_4^save/AssignVariableOp_5^save/AssignVariableOp_6^save/AssignVariableOp_7"/device:CPU:0
2
save/restore_all/NoOpNoOp^save/restore_shard
E
save/restore_all/NoOp_1NoOp^save/restore_shard_1"/device:CPU:0
J
save/restore_allNoOp^save/restore_all/NoOp^save/restore_all/NoOp_1"&?
save/Const:0save/Identity_32:0save/restore_all (5 @F8"ū
trainable_variablesćą
ī
!dnn/hiddenlayer_0/kernel/part_0:0&dnn/hiddenlayer_0/kernel/part_0/Assign5dnn/hiddenlayer_0/kernel/part_0/Read/ReadVariableOp:0"(
dnn/hiddenlayer_0/kernel  "(2<dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform:08
Ų
dnn/hiddenlayer_0/bias/part_0:0$dnn/hiddenlayer_0/bias/part_0/Assign3dnn/hiddenlayer_0/bias/part_0/Read/ReadVariableOp:0"#
dnn/hiddenlayer_0/bias "(21dnn/hiddenlayer_0/bias/part_0/Initializer/zeros:08
ī
!dnn/hiddenlayer_1/kernel/part_0:0&dnn/hiddenlayer_1/kernel/part_0/Assign5dnn/hiddenlayer_1/kernel/part_0/Read/ReadVariableOp:0"(
dnn/hiddenlayer_1/kernel@  "@(2<dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform:08
Ö
dnn/hiddenlayer_1/bias/part_0:0$dnn/hiddenlayer_1/bias/part_0/Assign3dnn/hiddenlayer_1/bias/part_0/Read/ReadVariableOp:0"!
dnn/hiddenlayer_1/bias@ "@(21dnn/hiddenlayer_1/bias/part_0/Initializer/zeros:08
ģ
!dnn/hiddenlayer_2/kernel/part_0:0&dnn/hiddenlayer_2/kernel/part_0/Assign5dnn/hiddenlayer_2/kernel/part_0/Read/ReadVariableOp:0"&
dnn/hiddenlayer_2/kernel@   "@ (2<dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform:08
Ö
dnn/hiddenlayer_2/bias/part_0:0$dnn/hiddenlayer_2/bias/part_0/Assign3dnn/hiddenlayer_2/bias/part_0/Read/ReadVariableOp:0"!
dnn/hiddenlayer_2/bias  " (21dnn/hiddenlayer_2/bias/part_0/Initializer/zeros:08
É
dnn/logits/kernel/part_0:0dnn/logits/kernel/part_0/Assign.dnn/logits/kernel/part_0/Read/ReadVariableOp:0"
dnn/logits/kernel   " (25dnn/logits/kernel/part_0/Initializer/random_uniform:08
³
dnn/logits/bias/part_0:0dnn/logits/bias/part_0/Assign,dnn/logits/bias/part_0/Read/ReadVariableOp:0"
dnn/logits/bias "(2*dnn/logits/bias/part_0/Initializer/zeros:08"×
	summariesÉ
Ę
/dnn/dnn/hiddenlayer_0/fraction_of_zero_values:0
"dnn/dnn/hiddenlayer_0/activation:0
/dnn/dnn/hiddenlayer_1/fraction_of_zero_values:0
"dnn/dnn/hiddenlayer_1/activation:0
/dnn/dnn/hiddenlayer_2/fraction_of_zero_values:0
"dnn/dnn/hiddenlayer_2/activation:0
(dnn/dnn/logits/fraction_of_zero_values:0
dnn/dnn/logits/activation:0"Ķ
	variablesæ¼
Z
global_step:0global_step/Assignglobal_step/read:02global_step/Initializer/zeros:0H
ī
!dnn/hiddenlayer_0/kernel/part_0:0&dnn/hiddenlayer_0/kernel/part_0/Assign5dnn/hiddenlayer_0/kernel/part_0/Read/ReadVariableOp:0"(
dnn/hiddenlayer_0/kernel  "(2<dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform:08
Ų
dnn/hiddenlayer_0/bias/part_0:0$dnn/hiddenlayer_0/bias/part_0/Assign3dnn/hiddenlayer_0/bias/part_0/Read/ReadVariableOp:0"#
dnn/hiddenlayer_0/bias "(21dnn/hiddenlayer_0/bias/part_0/Initializer/zeros:08
ī
!dnn/hiddenlayer_1/kernel/part_0:0&dnn/hiddenlayer_1/kernel/part_0/Assign5dnn/hiddenlayer_1/kernel/part_0/Read/ReadVariableOp:0"(
dnn/hiddenlayer_1/kernel@  "@(2<dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform:08
Ö
dnn/hiddenlayer_1/bias/part_0:0$dnn/hiddenlayer_1/bias/part_0/Assign3dnn/hiddenlayer_1/bias/part_0/Read/ReadVariableOp:0"!
dnn/hiddenlayer_1/bias@ "@(21dnn/hiddenlayer_1/bias/part_0/Initializer/zeros:08
ģ
!dnn/hiddenlayer_2/kernel/part_0:0&dnn/hiddenlayer_2/kernel/part_0/Assign5dnn/hiddenlayer_2/kernel/part_0/Read/ReadVariableOp:0"&
dnn/hiddenlayer_2/kernel@   "@ (2<dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform:08
Ö
dnn/hiddenlayer_2/bias/part_0:0$dnn/hiddenlayer_2/bias/part_0/Assign3dnn/hiddenlayer_2/bias/part_0/Read/ReadVariableOp:0"!
dnn/hiddenlayer_2/bias  " (21dnn/hiddenlayer_2/bias/part_0/Initializer/zeros:08
É
dnn/logits/kernel/part_0:0dnn/logits/kernel/part_0/Assign.dnn/logits/kernel/part_0/Read/ReadVariableOp:0"
dnn/logits/kernel   " (25dnn/logits/kernel/part_0/Initializer/random_uniform:08
³
dnn/logits/bias/part_0:0dnn/logits/bias/part_0/Assign,dnn/logits/bias/part_0/Read/ReadVariableOp:0"
dnn/logits/bias "(2*dnn/logits/bias/part_0/Initializer/zeros:08"m
global_step^\
Z
global_step:0global_step/Assignglobal_step/read:02global_step/Initializer/zeros:0H"ę+
cond_contextÕ+Ņ+
¬
 dnn/zero_fraction/cond/cond_text dnn/zero_fraction/cond/pred_id:0!dnn/zero_fraction/cond/switch_t:0 *Ą
dnn/hiddenlayer_0/Relu:0
dnn/zero_fraction/cond/Cast:0
+dnn/zero_fraction/cond/count_nonzero/Cast:0
,dnn/zero_fraction/cond/count_nonzero/Const:0
6dnn/zero_fraction/cond/count_nonzero/NotEqual/Switch:1
/dnn/zero_fraction/cond/count_nonzero/NotEqual:0
4dnn/zero_fraction/cond/count_nonzero/nonzero_count:0
,dnn/zero_fraction/cond/count_nonzero/zeros:0
 dnn/zero_fraction/cond/pred_id:0
!dnn/zero_fraction/cond/switch_t:0R
dnn/hiddenlayer_0/Relu:06dnn/zero_fraction/cond/count_nonzero/NotEqual/Switch:1D
 dnn/zero_fraction/cond/pred_id:0 dnn/zero_fraction/cond/pred_id:0

"dnn/zero_fraction/cond/cond_text_1 dnn/zero_fraction/cond/pred_id:0!dnn/zero_fraction/cond/switch_f:0*Æ
dnn/hiddenlayer_0/Relu:0
-dnn/zero_fraction/cond/count_nonzero_1/Cast:0
.dnn/zero_fraction/cond/count_nonzero_1/Const:0
8dnn/zero_fraction/cond/count_nonzero_1/NotEqual/Switch:0
1dnn/zero_fraction/cond/count_nonzero_1/NotEqual:0
6dnn/zero_fraction/cond/count_nonzero_1/nonzero_count:0
.dnn/zero_fraction/cond/count_nonzero_1/zeros:0
 dnn/zero_fraction/cond/pred_id:0
!dnn/zero_fraction/cond/switch_f:0T
dnn/hiddenlayer_0/Relu:08dnn/zero_fraction/cond/count_nonzero_1/NotEqual/Switch:0D
 dnn/zero_fraction/cond/pred_id:0 dnn/zero_fraction/cond/pred_id:0
Ź
"dnn/zero_fraction_1/cond/cond_text"dnn/zero_fraction_1/cond/pred_id:0#dnn/zero_fraction_1/cond/switch_t:0 *Ų
dnn/hiddenlayer_1/Relu:0
dnn/zero_fraction_1/cond/Cast:0
-dnn/zero_fraction_1/cond/count_nonzero/Cast:0
.dnn/zero_fraction_1/cond/count_nonzero/Const:0
8dnn/zero_fraction_1/cond/count_nonzero/NotEqual/Switch:1
1dnn/zero_fraction_1/cond/count_nonzero/NotEqual:0
6dnn/zero_fraction_1/cond/count_nonzero/nonzero_count:0
.dnn/zero_fraction_1/cond/count_nonzero/zeros:0
"dnn/zero_fraction_1/cond/pred_id:0
#dnn/zero_fraction_1/cond/switch_t:0H
"dnn/zero_fraction_1/cond/pred_id:0"dnn/zero_fraction_1/cond/pred_id:0T
dnn/hiddenlayer_1/Relu:08dnn/zero_fraction_1/cond/count_nonzero/NotEqual/Switch:1
·
$dnn/zero_fraction_1/cond/cond_text_1"dnn/zero_fraction_1/cond/pred_id:0#dnn/zero_fraction_1/cond/switch_f:0*Å
dnn/hiddenlayer_1/Relu:0
/dnn/zero_fraction_1/cond/count_nonzero_1/Cast:0
0dnn/zero_fraction_1/cond/count_nonzero_1/Const:0
:dnn/zero_fraction_1/cond/count_nonzero_1/NotEqual/Switch:0
3dnn/zero_fraction_1/cond/count_nonzero_1/NotEqual:0
8dnn/zero_fraction_1/cond/count_nonzero_1/nonzero_count:0
0dnn/zero_fraction_1/cond/count_nonzero_1/zeros:0
"dnn/zero_fraction_1/cond/pred_id:0
#dnn/zero_fraction_1/cond/switch_f:0H
"dnn/zero_fraction_1/cond/pred_id:0"dnn/zero_fraction_1/cond/pred_id:0V
dnn/hiddenlayer_1/Relu:0:dnn/zero_fraction_1/cond/count_nonzero_1/NotEqual/Switch:0
Ź
"dnn/zero_fraction_2/cond/cond_text"dnn/zero_fraction_2/cond/pred_id:0#dnn/zero_fraction_2/cond/switch_t:0 *Ų
dnn/hiddenlayer_2/Relu:0
dnn/zero_fraction_2/cond/Cast:0
-dnn/zero_fraction_2/cond/count_nonzero/Cast:0
.dnn/zero_fraction_2/cond/count_nonzero/Const:0
8dnn/zero_fraction_2/cond/count_nonzero/NotEqual/Switch:1
1dnn/zero_fraction_2/cond/count_nonzero/NotEqual:0
6dnn/zero_fraction_2/cond/count_nonzero/nonzero_count:0
.dnn/zero_fraction_2/cond/count_nonzero/zeros:0
"dnn/zero_fraction_2/cond/pred_id:0
#dnn/zero_fraction_2/cond/switch_t:0H
"dnn/zero_fraction_2/cond/pred_id:0"dnn/zero_fraction_2/cond/pred_id:0T
dnn/hiddenlayer_2/Relu:08dnn/zero_fraction_2/cond/count_nonzero/NotEqual/Switch:1
·
$dnn/zero_fraction_2/cond/cond_text_1"dnn/zero_fraction_2/cond/pred_id:0#dnn/zero_fraction_2/cond/switch_f:0*Å
dnn/hiddenlayer_2/Relu:0
/dnn/zero_fraction_2/cond/count_nonzero_1/Cast:0
0dnn/zero_fraction_2/cond/count_nonzero_1/Const:0
:dnn/zero_fraction_2/cond/count_nonzero_1/NotEqual/Switch:0
3dnn/zero_fraction_2/cond/count_nonzero_1/NotEqual:0
8dnn/zero_fraction_2/cond/count_nonzero_1/nonzero_count:0
0dnn/zero_fraction_2/cond/count_nonzero_1/zeros:0
"dnn/zero_fraction_2/cond/pred_id:0
#dnn/zero_fraction_2/cond/switch_f:0H
"dnn/zero_fraction_2/cond/pred_id:0"dnn/zero_fraction_2/cond/pred_id:0V
dnn/hiddenlayer_2/Relu:0:dnn/zero_fraction_2/cond/count_nonzero_1/NotEqual/Switch:0
Ā
"dnn/zero_fraction_3/cond/cond_text"dnn/zero_fraction_3/cond/pred_id:0#dnn/zero_fraction_3/cond/switch_t:0 *Š
dnn/logits/BiasAdd:0
dnn/zero_fraction_3/cond/Cast:0
-dnn/zero_fraction_3/cond/count_nonzero/Cast:0
.dnn/zero_fraction_3/cond/count_nonzero/Const:0
8dnn/zero_fraction_3/cond/count_nonzero/NotEqual/Switch:1
1dnn/zero_fraction_3/cond/count_nonzero/NotEqual:0
6dnn/zero_fraction_3/cond/count_nonzero/nonzero_count:0
.dnn/zero_fraction_3/cond/count_nonzero/zeros:0
"dnn/zero_fraction_3/cond/pred_id:0
#dnn/zero_fraction_3/cond/switch_t:0P
dnn/logits/BiasAdd:08dnn/zero_fraction_3/cond/count_nonzero/NotEqual/Switch:1H
"dnn/zero_fraction_3/cond/pred_id:0"dnn/zero_fraction_3/cond/pred_id:0
Æ
$dnn/zero_fraction_3/cond/cond_text_1"dnn/zero_fraction_3/cond/pred_id:0#dnn/zero_fraction_3/cond/switch_f:0*½
dnn/logits/BiasAdd:0
/dnn/zero_fraction_3/cond/count_nonzero_1/Cast:0
0dnn/zero_fraction_3/cond/count_nonzero_1/Const:0
:dnn/zero_fraction_3/cond/count_nonzero_1/NotEqual/Switch:0
3dnn/zero_fraction_3/cond/count_nonzero_1/NotEqual:0
8dnn/zero_fraction_3/cond/count_nonzero_1/nonzero_count:0
0dnn/zero_fraction_3/cond/count_nonzero_1/zeros:0
"dnn/zero_fraction_3/cond/pred_id:0
#dnn/zero_fraction_3/cond/switch_f:0R
dnn/logits/BiasAdd:0:dnn/zero_fraction_3/cond/count_nonzero_1/NotEqual/Switch:0H
"dnn/zero_fraction_3/cond/pred_id:0"dnn/zero_fraction_3/cond/pred_id:0"%
saved_model_main_op


group_deps*Č
predict¼
=
old_defence_target'
old_defence_target:0’’’’’’’’’
3
old_hp_target"
old_hp_target:0’’’’’’’’’
;
old_attack_source&
old_attack_source:0’’’’’’’’’
?
old_terrain_source)
old_terrain_source_1:0’’’’’’’’’
;
old_attack_target&
old_attack_target:0’’’’’’’’’
=
old_defence_source'
old_defence_source:0’’’’’’’’’
?
old_terrain_target)
old_terrain_target_1:0’’’’’’’’’
3
old_hp_source"
old_hp_source:0’’’’’’’’’:
predictions+
dnn/logits/BiasAdd:0’’’’’’’’’tensorflow/serving/predict