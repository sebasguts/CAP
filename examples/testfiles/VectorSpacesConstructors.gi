
LoadPackage( "CategoriesForHomalg" );

LoadPackage( "MatricesForHomalg" );

###################################
##
## Technical stuff
##
###################################

BindGlobal( "VectorSpacesConstructorsLoaded", true );

###################################
##
## Types and Representations
##
###################################

DeclareRepresentation( "IsHomalgRationalVectorSpaceRep",
                       IsHomalgCategoryObjectRep,
                       [ ] );

BindGlobal( "TheTypeOfHomalgRationalVectorSpaces",
        NewType( TheFamilyOfHomalgCategoryObjects,
                IsHomalgRationalVectorSpaceRep ) );

DeclareRepresentation( "IsHomalgRationalVectorSpaceMorphismRep",
                       IsHomalgCategoryMorphismRep,
                       [ ] );

BindGlobal( "TheTypeOfHomalgRationalVectorSpaceMorphism",
        NewType( TheFamilyOfHomalgCategoryMorphisms,
                IsHomalgRationalVectorSpaceMorphismRep ) );

###################################
##
## Attributes
##
###################################
                
DeclareAttribute( "Dimension",
                  IsHomalgRationalVectorSpaceRep );

#######################################
##
## Operations
##
#######################################

DeclareOperation( "QVectorSpace",
                  [ IsInt ] );

DeclareOperation( "VectorSpaceMorphism",
                  [ IsHomalgRationalVectorSpaceRep, IsObject, IsHomalgRationalVectorSpaceRep ] );

vecspaces := true;

VECTORSPACES_FIELD := HomalgFieldOfRationals( );

#######################################
##
## Categorical Implementations
##
#######################################

##
InstallMethod( QVectorSpace,
               [ IsInt ],
               
  function( dim )
    local space;
    
    space := rec( );
    
    ObjectifyWithAttributes( space, TheTypeOfHomalgRationalVectorSpaces,
                             Dimension, dim 
    );

    # is this the right place?
    Add( vecspaces, space );
    
    return space;
    
end );

##
InstallMethod( VectorSpaceMorphism,
                  [ IsHomalgRationalVectorSpaceRep, IsObject, IsHomalgRationalVectorSpaceRep ],
                  
  function( source, matrix, range )
    local morphism;

    if not IsHomalgMatrix( matrix ) then
    
      morphism := HomalgMatrix( matrix, Dimension( source ), Dimension( range ), VECTORSPACES_FIELD );

    else

      morphism := matrix;

    fi;

    morphism := rec( morphism := morphism );
    
    
    ObjectifyWithAttributes( morphism, TheTypeOfHomalgRationalVectorSpaceMorphism,
                             Source, source,
                             Range, range 
    );

    Add( vecspaces, morphism );
    
    return morphism;
    
end );


#######################################
##
## View and Display
##
#######################################

InstallMethod( ViewObj,
               [ IsHomalgRationalVectorSpaceRep ],

  function( obj )

    Print( "<A rational vector space of dimension ", String( Dimension( obj ) ), ">" );

end );

InstallMethod( ViewObj,
               [ IsHomalgRationalVectorSpaceMorphismRep ],

  function( obj )

    Print( "A rational vector space homomorphism with matrix: \n" );
# 
#     Print( String( obj!.morphism ) );
  
    Display( obj!.morphism );

end );