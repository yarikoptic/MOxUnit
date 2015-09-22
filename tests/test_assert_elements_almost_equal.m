function test_suite=test_assert_elements_almost_equal()
    initTestSuite;

function test_assert_elements_almost_equal_exceptions
    assertExceptionThrown(@()assertElementsAlmostEqual(...
                                [],'a'),...
                                        'moxunit:differentSize');
    assertExceptionThrown(@()assertElementsAlmostEqual(...
                                [1 2],[1;2]),...
                                        'moxunit:differentSize');
    assertExceptionThrown(@()assertElementsAlmostEqual(...
                                [1 2],[1 3]),...
                                        'moxunit:floatsNotAlmostEqual');
    assertExceptionThrown(@()assertElementsAlmostEqual(...
                                0,1e-10,'absolute',1e-11),...
                                        'moxunit:floatsNotAlmostEqual');
    assertExceptionThrown(@()assertElementsAlmostEqual(...
                                0,1e-24,'relative',0,0),...
                                        'moxunit:floatsNotAlmostEqual');
    assertExceptionThrown(@()assertElementsAlmostEqual(...
                                NaN,Inf),...
                                        'moxunit:floatsNotAlmostEqual');
    assertExceptionThrown(@()assertElementsAlmostEqual(...
                                -Inf,Inf),...
                                        'moxunit:floatsNotAlmostEqual');
    assertExceptionThrown(@()assertElementsAlmostEqual(...
                                struct(),struct()),...
                                        'moxunit:notFloat');
    assertExceptionThrown(@()assertElementsAlmostEqual(...
                                {1,'a'},{1,'a'}),...
                                        'moxunit:notFloat');




function test_assert_elements_almost_equal_passes
    assertElementsAlmostEqual(0,0);
    assertElementsAlmostEqual(0,1e-10);
    assertElementsAlmostEqual(0,1,'relative',1);
    assertElementsAlmostEqual(0,1,'absolute',1);
    assertElementsAlmostEqual(1:6,1e-10+(1:6));
    assertElementsAlmostEqual([1 2;3 4],1e-10+[1 2; 3 4]);
    assertElementsAlmostEqual(NaN,NaN);
    assertElementsAlmostEqual(NaN,NaN,'relative',0);
    assertElementsAlmostEqual(NaN,NaN,'absolute',0);
    assertElementsAlmostEqual(Inf,Inf);
    assertElementsAlmostEqual([-Inf,Inf,NaN,2],[-Inf,Inf,NaN,2]);
    assertElementsAlmostEqual(0,sparse(0));
    assertElementsAlmostEqual(double(0),single(0));

