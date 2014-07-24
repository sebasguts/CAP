#############################################################################
##
##                                               CategoriesForHomalg package
##
##  Copyright 2014, Sebastian Gutsche, TU Kaiserslautern
##                  Sebastian Posur,   RWTH Aachen
##
#! @Chapter Generalized morphism category
##
#############################################################################

DeclareCategory( "IsGeneralizedMorphismCategoryObject",
                 IsHomalgCategoryObject );

DeclareCategory( "IsGeneralizedMorphism",
                 IsHomalgCategoryMorphism );

####################################
##
## Constructors
##
####################################

DeclareAttribute( "GeneralizedMorphismCategory",
                  IsHomalgCategory );

DeclareGlobalFunction( "INSTALL_FUNCTIONS_FOR_GENERALIZED_MORPHISM_CATEGORY" );

DeclareAttribute( "UnderlyingHonestCategory",
                  IsHomalgCategory );

DeclareAttribute( "GeneralizedMorphismObject",
                  IsHomalgCategoryObject );

DeclareAttribute( "UnderlyingHonestObject",
                  IsGeneralizedMorphismCategoryObject );

DeclareOperation( "GeneralizedMorphism",
                  [ IsHomalgCategoryMorphism, IsHomalgCategoryMorphism, IsHomalgCategoryMorphism ] );

DeclareOperation( "GeneralizedMorphismWithSourceAid",
                  [ IsHomalgCategoryMorphism, IsHomalgCategoryMorphism ] );

DeclareOperation( "GeneralizedMorphismWithRangeAid",
                  [ IsHomalgCategoryMorphism, IsHomalgCategoryMorphism ] );

DeclareAttributeWithToDoForIsWellDefined( "AsGeneralizedMorphism",
                                          IsHomalgCategoryMorphism );

DeclareOperation( "GeneralizedMorphismFromFactorToSubobject",
                  [ IsHomalgCategoryMorphism, IsHomalgCategoryMorphism ] );

####################################
##
## Attributes
##
####################################

DeclareAttribute( "SourceAid",
                  IsGeneralizedMorphism );

DeclareAttribute( "RangeAid",
                  IsGeneralizedMorphism );

DeclareAttribute( "AssociatedMorphism",
                  IsGeneralizedMorphism );

DeclareProperty( "IsHonest",
                  IsGeneralizedMorphism );

DeclareProperty( "HasHonestSource",
                  IsGeneralizedMorphism );

DeclareProperty( "HasHonestRange",
                  IsGeneralizedMorphism );

InstallTrueMethod( IsHonest, HasHonestRange and HasHonestSource );

InstallTrueMethod( HasHonestRange, IsHonest );

InstallTrueMethod( HasHonestSource, IsHonest );

