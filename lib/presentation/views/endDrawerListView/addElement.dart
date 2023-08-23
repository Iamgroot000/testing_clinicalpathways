import 'package:testing_clinicalpathways/domain/entities/ClinicalPathwayFlavourCategories.dart';
import 'package:testing_clinicalpathways/domain/entities/clinicalPathwayFlavourCategories.dart';

import 'package:testing_clinicalpathways/presentation/views/endDrawerListView/addCustomAgeGroup.dart';
import 'package:testing_clinicalpathways/presentation/views/endDrawerListView/addOptionAndMultiOption.dart';
import 'package:testing_clinicalpathways/presentation/views/endDrawerListView/addRangeAndAgeInAgeGroup.dart';
import 'package:testing_clinicalpathways/presentation/views/presentationLayerConnectors.dart';
import 'package:testing_clinicalpathways/globals.dart' as globals;
import 'package:testing_clinicalpathways/presentation/widgets/chipChoiceMultiple.dart';
import 'package:testing_clinicalpathways/presentation/widgets/chipChoiceSingle.dart';



/// ADD ELEMENT END DRAWER WITH -----------> (SHAPES, CATEGORIES, GENDER, IS_MANDATORY, EDIT QUESTIONS)
class EndDrawerForAddElement extends GetWidget<HomeController> {
  const EndDrawerForAddElement({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Drawer(
          width: (controller.isExtended.value)
              ? ScreenSize.width(context) * 0.8
              : ScreenSize.width(context) * 0.5,
          backgroundColor: AppColor.white,
          child: Row(
            children: [
              // Collapsible Section (Left Container)
              Visibility(
                visible: controller.isExtended.value,
                child: SizedBox(
                  width: ScreenSize.width(context) * 0.3,
                  child: controller.isOptionsDialog.value
                      ? const AddOptionsDialogState()
                      : const AgeGroupEdit(),
                ),
              ),

              // Main Content (GetBuilder)
              GetBuilder(
                  init: controller,
                  builder: (_) {
                    return LoadingOverlay(
                      color: AppColor.white,
                      opacity: 1.0,
                      progressIndicator: const SquareRotatingAnimation(),
                      isLoading: controller.addHomeEntityButtonLoading.value,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ///HEADER
                          Expanded(
                              flex: 27,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// TITLE
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 3.0, bottom: 3.0),
                                    child: Container(
                                      width: ScreenSize.width(context) * 0.5,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 3.0, horizontal: 8.0),
                                      decoration: BoxDecoration(
                                          color: AppColor.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      // Add a background color
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.add_circle,
                                            color: Colors.white,
                                            size: 24,
                                          ),
                                          const SizedBox(width: 8),
                                          // Add some spacing between the icon and text
                                          const Text(
                                            AppConst.addElements,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const Spacer(),
                                          IconButton(
                                            onPressed: () {
                                              controller.deleteElement();
                                            },
                                            icon: const Icon(
                                              Icons.delete,
                                              color: Colors.white,
                                              size: 24,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  /// ADD ELEMENT
                                  SizedBox(
                                    height: ScreenSize.height(context) * 0.15,
                                    width: ScreenSize.width(context) * 0.5,
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.all(6.0),
                                      child: ListView.separated(
                                        itemCount: globals
                                            .elementShapesList.length,
                                        separatorBuilder: (context, index) =>
                                        const SizedBox(
                                            width: 6.0),
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {

                                          bool isSelected = (controller.selectedIndexForElement == index);

                                          return Column(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  controller.updateIndexForElements(index:
                                                  index);
                                                },
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                    left: 3.0,
                                                    right: 3.0,
                                                  ),
                                                  child: Container(
                                                    width: ScreenSize
                                                        .width(
                                                        context) *
                                                        0.07,
                                                    height: ScreenSize
                                                        .height(
                                                        context) *
                                                        0.1,
                                                    decoration:
                                                    BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                        border:
                                                        Border
                                                            .all(
                                                          color: isSelected
                                                              ? Colors.blue
                                                              : Colors.grey.shade500,
                                                            //color: Colors.blue,
                                                            width: isSelected
                                                                ? 2.0
                                                                : 1.0,
                                                            //width: 1.0
                                                        )),
                                                    child:
                                                    Image.asset(
                                                      globals
                                                          .elementShapesList[
                                                      index]
                                                          .flowElementImage!,
                                                      width: 50,
                                                      height: 50,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets
                                                    .only(
                                                    top: 5.0),
                                                child: AutoSizeText(
                                                  globals.elementShapesList[index].flowElementName! ??
                                                      "",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: isSelected
                                                        ? Colors.blue
                                                        : Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    )
                                  ),

                                  SizedBox(
                                    width: ScreenSize.width(context) * 0.5,
                                    child: const Divider(
                                      color: AppColor.primaryColor,
                                    ),
                                  ),
                                ],
                              )),

                          ///body
                          Expanded(
                              flex: 70,
                              child: SingleChildScrollView(
                                child: SizedBox(
                                  width: ScreenSize.width(context) * 0.5,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      (!(controller
                                                  .homeEntityList[controller
                                                      .selectedIndex.value]
                                                  .flowchartName
                                                  .compareTo("Master") ==
                                              0))
                                          ?

                                          ///QUESTION CATEGORIES
                                          Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    'Question Category',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SingleChipChoice(
                                                    selectedValue: controller
                                                        .selectedCategory.value,
                                                    choiceList: controller
                                                        .clinicalPathwayCategoriesList
                                                        .categoryList,
                                                    onChanged: (val) {
                                                      controller.selectedCategory.value = val;
                                                    },
                                                    valueFn: (i, v) => v,
                                                    labelFn: (i, v) => v,
                                                    tooltipFn: (i, v) => v,
                                                  ),
                                                ],
                                              ))
                                          : Container(
                                        height: 0.0001,
                                      ),

                                      
                                      ///flavour
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Add flavour',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: controller.clinicalPathwayFlavourCategoriesList.flavourList
                                                    .map((flavor) => ExpansionTile(
                                                  title: Text(flavor),
                                                  children: [
                                                    MultipleChipChoice(
                                                      selectedValues: controller
                                                          .selectedGenders.value,
                                                      choiceList: controller
                                                          .genderGroupStandardList
                                                          .value
                                                          .genderGroupList,
                                                      onChanged: (val) {
                                                        controller.selectedGenders
                                                            .value = val;
                                                        controller
                                                            .selectedGenders.value
                                                            .removeWhere((gender) =>
                                                        gender.isEmpty);
                                                        // controller.selectedGenders.value = val;
                                                      },
                                                      valueFn: (i, v) => v,
                                                      labelFn: (i, v) => v,
                                                      tooltipFn: (i, v) => v,
                                                    ),
                                                      //  ListTile(
                                                      //   title: Text('Age'), // You can replace 'controller.selectedAge' with the actual variable for age.
                                                      //   onTap: () { controller.selectedAges;
                                                      //     // Show a dialog or perform an action to update age.
                                                      //   },
                                                      // ),

                                                    // ListTile(
                                                    //   title: Text('Age'), // You can replace 'controller.selectedGender' with the actual variable for gender.
                                                    //   onTap: () {
                                                    //     controller.selectedGenders;
                                                    //     // Show a dialog or perform an action to update gender.
                                                    //   },
                                                    // ),
                                                    ChipsChoice<String>.multiple(
                                                      value: controller
                                                          .selectedAges.value,
                                                      onChanged: (val) {
                                                        controller
                                                            .selectedAges.value = val;
                                                        controller.updateListOfAgeGroupItems();
                                                      },
                                                      choiceItems: C2Choice.listFrom<
                                                          String, AgeGroupItem>(
                                                        source: controller
                                                            .ageGroupItemList,
                                                        value: (i, v) => v.groupName!,
                                                        label: (i, v) => v.groupName!,
                                                        tooltip: (i, v) =>
                                                        "Start :${v.start}, End :${v.end}",
                                                      ),
                                                      choiceCheckmark: true,
                                                      choiceStyle: C2ChipStyle.filled(
                                                        overlayColor:
                                                        AppColor.primaryColor,
                                                        foregroundStyle:
                                                        const TextStyle(
                                                            fontWeight:
                                                            FontWeight.w700),
                                                        height: ScreenSize.height(
                                                            context) *
                                                            0.04,
                                                        color: AppColor.greyShimmer,
                                                        selectedStyle:
                                                        const C2ChipStyle(
                                                          elevation: 2,
                                                          backgroundColor:
                                                          AppColor.primaryColor,
                                                          borderRadius:
                                                          BorderRadius.all(
                                                            Radius.circular(25),
                                                          ),
                                                        ),
                                                      ),
                                                    ),




                                                    Row(
                                                      children: [
                                                        /// IS MANDATORY CHECKBOX
                                                        Padding(
                                                          padding:
                                                          const EdgeInsets.all(8.0),
                                                          child: Row(
                                                            children: [
                                                              const Text(
                                                                AppConst.isMandatory,
                                                                style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                  FontWeight.bold,
                                                                ),
                                                              ),
                                                              Checkbox(
                                                                checkColor:
                                                                AppColor.black,
                                                                // focusColor: AppColor.primaryColor,
                                                                activeColor: AppColor
                                                                    .primaryColor,
                                                                value: controller
                                                                    .isMandatory.value,
                                                                onChanged:
                                                                    (bool? value) {
                                                                  controller.isMandatory
                                                                      .value =
                                                                      value ?? false;
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ),



                                                        /// IS FOLLOW UP
                                                        Padding(
                                                          padding:
                                                          const EdgeInsets.all(8.0),
                                                          child: Row(
                                                            children: [
                                                              const Text(
                                                                AppConst.isFollowUp,
                                                                style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                  FontWeight.bold,
                                                                ),
                                                              ),
                                                              Checkbox(
                                                                checkColor:
                                                                AppColor.black,
                                                                // focusColor: AppColor.primaryColor,
                                                                activeColor: AppColor
                                                                    .primaryColor,
                                                                value: controller
                                                                    .isFollowUp.value,
                                                                onChanged:
                                                                    (bool? value) {
                                                                  controller.updateIsFollowUp(value ?? false);
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ),




                                                      /// IS PREGNANT
                                                      Padding(
                                                        padding:
                                                        const EdgeInsets.all(8.0),
                                                        child: Row(
                                                          children: [
                                                            const Text(
                                                              AppConst.isPregnant,
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                FontWeight.bold,
                                                              ),
                                                            ),
                                                            Checkbox(
                                                              checkColor:
                                                              AppColor.black,
                                                              focusColor: AppColor.primaryColor,
                                                              activeColor: AppColor.primaryColor,
                                                              value: controller.isPregnancy.value,
                                                              onChanged: (bool? value) {
                                                                controller.updateIsPregnancy(value ?? false);
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 30),
                                                  Container(
                                                    height: 50,
                                                    width: 100,
                                                    child: (
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.end,
                                                          children: [
                                                            OutlinedButton(onPressed:(){
                                                              }, child: Text("Submit"))
                                                          ],
                                                        )
                                                    ),
                                                  ),
                                                ],
                                              ))
                                                  .toList(),
                                            ),



                                          ],
                                        ),
                                      ),


                                      Container(
                                              height: 0.0001,
                                            ),
                              ///######        /// add flavour   ###############

                                      /// GENDER
                                      Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Gender',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              MultipleChipChoice(
                                                selectedValues: controller
                                                    .selectedGenders.value,
                                                choiceList: controller
                                                    .genderGroupStandardList
                                                    .value
                                                    .genderGroupList,
                                                onChanged: (val) {
                                                  controller.selectedGenders
                                                      .value = val;
                                                  controller
                                                      .selectedGenders.value
                                                      .removeWhere((gender) =>
                                                          gender.isEmpty);
                                                  // controller.selectedGenders.value = val;
                                                },
                                                valueFn: (i, v) => v,
                                                labelFn: (i, v) => v,
                                                tooltipFn: (i, v) => v,
                                              ),
                                            ],
                                          )),

                                      ///AGE OPTIONS
                                      Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  const Text(
                                                    'Age Group',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  IconButton(
                                                    tooltip: 'Select All',
                                                    icon: const Icon(Icons
                                                        .library_add_check_outlined),
                                                    onPressed: () {
                                                      controller
                                                          .selectAllAgeGroups();
                                                      // List<String>allAgeGroupNames =
                                                      // controller.ageGroupItemList!.map((item) => item.groupName!).toList();
                                                      // controller.selectedAges.value = allAgeGroupNames;
                                                    },
                                                  ),
                                                  IconButton(
                                                    tooltip: 'Deselect All',
                                                    icon: const Icon(Icons
                                                        .indeterminate_check_box_outlined),
                                                    onPressed: () {
                                                      controller.selectedAges
                                                          .value = [];
                                                    },
                                                  ),
                                                  IconButton(
                                                    tooltip: 'Range',
                                                    icon: const Icon(Icons
                                                        .edit_note),
                                                    onPressed: () {
                                                      controller.updateIsExtented(isExtented: true,isOptionsDialog: false);
                                                    },
                                                  ),
                                                ],
                                              ),
                                              ChipsChoice<String>.multiple(
                                                value: controller
                                                    .selectedAges.value,
                                                onChanged: (val) {
                                                  controller
                                                      .selectedAges.value = val;
                                                  controller.updateListOfAgeGroupItems();
                                                },
                                                choiceItems: C2Choice.listFrom<
                                                    String, AgeGroupItem>(
                                                  source: controller
                                                      .ageGroupItemList!,
                                                  value: (i, v) => v.groupName!,
                                                  label: (i, v) => v.groupName!,
                                                  tooltip: (i, v) =>
                                                      "Start :${v.start}, End :${v.end}",
                                                ),
                                                choiceCheckmark: true,
                                                choiceStyle: C2ChipStyle.filled(
                                                  overlayColor:
                                                      AppColor.primaryColor,
                                                  foregroundStyle:
                                                      const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700),
                                                  height: ScreenSize.height(
                                                          context) *
                                                      0.04,
                                                  color: AppColor.greyShimmer,
                                                  selectedStyle:
                                                      const C2ChipStyle(
                                                    elevation: 2,
                                                    backgroundColor:
                                                        AppColor.primaryColor,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(25),
                                                    ),
                                                  ),
                                                ),
                                                leading: IconButton(
                                                  tooltip: 'Add Choice',
                                                  icon: const Icon(
                                                      Icons.add_box_rounded),
                                                  onPressed: () async {
                                                    // Show the custom dialog and get the result (newly created AgeGroupItem)
                                                    await showDialog<
                                                        AgeGroupItem>(
                                                      context: context,
                                                      builder: (context) =>
                                                          const AgeGroupItemInputDialog(),
                                                    );
                                                  },
                                                ),
                                                trailing: IconButton(
                                                  tooltip: 'Remove Choice',
                                                  icon: const Icon(
                                                      Icons.remove_circle),
                                                  onPressed: () async {
                                                    bool? confirmRemoval = await showConfirmationDialog(context);
                                                    if (confirmRemoval ?? false) {
                                                      controller.ageGroupItemList.removeLast();
                                                    }
                                                  },
                                                ),
                                              )
                                            ],
                                          )),

                                      ///for connector
                                      (globals.elementShapesList[controller.selectedIndexForElement.value].flowElementName?.compareTo(AppConst.connectorElement) == 0)
                                          ? SizedBox(
                                              child: Column(
                                                crossAxisAlignment:CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    AppConst.navigationFlowchart,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SingleChipChoice(
                                                    selectedValue: controller.dashboards.value!,
                                                    choiceList: controller.homeEntityList,
                                                    onChanged: (val) {
                                                      controller.dashboards.value = val;
                                                      controller.updateDashboard(val);
                                                    },
                                                    valueFn: (i, v) =>
                                                        v.flowchartName,
                                                    labelFn: (i, v) =>
                                                        v.flowchartName,
                                                    tooltipFn: (i, v) => '',
                                                  ),
                                                ],
                                              ),
                                            )
                                          : SizedBox(
                                              child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                ///Question textbox
                                                SizedBox(
                                                  width: ScreenSize.width(
                                                          context) *
                                                      0.5,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Text(
                                                          AppConst.questionText,
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 10),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                color: Colors
                                                                    .grey),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                          ),
                                                          child:
                                                              AnimatedBuilder(animation: controller.elementTextController,
                                                            builder: (context,child) {
                                                              int lines = controller.elementTextController.text.split('\n').length;
                                                              return ConstrainedBox(
                                                                constraints:
                                                                    BoxConstraints(
                                                                  minHeight: lines *
                                                                      24.0, // Adjust the line height as needed
                                                                ),
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          15),
                                                                  child:
                                                                      TextField(
                                                                    autocorrect:
                                                                        true,
                                                                    maxLines:
                                                                        null,
                                                                    controller: controller.elementTextController,
                                                                    onChanged:(text) {
                                                                      controller.questionTxt.value = text.toString();
                                                                      debugPrint('User submitted text: $text');
                                                                      debugPrint('User submitted text: ${controller.questionTxt.value}');
                                                                    },
                                                                    decoration:
                                                                        const InputDecoration(
                                                                      hintText:
                                                                      AppConst.enterYourQuestionTextHere,
                                                                      border: InputBorder
                                                                          .none,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),

                                                ///SELECTION MODE FOR (RECTANGLE --> TEXT , NUMERIC , DATE , DATE&TIME ),(PENTAGONAL --> OPTIONS, MULTI-SELECTIONS)
                                                (globals.elementShapesList[controller.selectedIndexForElement.value].typeMode.isNotEmpty)
                                                    ? Obx(() {
                                                        final isRectangle = globals.elementShapesList[controller.selectedIndexForElement.value]
                                                                .flowElementName
                                                                ?.compareTo(AppConst
                                                                    .rectangleElement) ==
                                                            0;
                                                        final selectedMode =
                                                            controller
                                                                .selectedMode
                                                                .value;
                                                        return Row(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  const Text(
                                                                    AppConst.selectionModes,
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                  SingleChipChoice(
                                                                    selectedValue:
                                                                        controller
                                                                            .selectedMode
                                                                            .value,
                                                                    choiceList: globals
                                                                        .elementShapesList[controller
                                                                            .selectedIndexForElement
                                                                            .value]
                                                                        .typeMode,
                                                                    onChanged:
                                                                        (val) {
                                                                      controller
                                                                          .selectedMode
                                                                          .value = val;
                                                                      if (val =="isOptions" ||
                                                                          val =="isMultiOptions") {
                                                                        controller.updateIsExtented(isExtented:true, isOptionsDialog: true);
                                                                      }
                                                                    },
                                                                    valueFn:(i, v) =>v,
                                                                    labelFn:(i, v) => v,
                                                                    tooltipFn:(i, v) => v,
                                                                  ),

                                                             /// EDIT TEXT FOR ADDING LIMIT TO THE NUMBER
                                                                  (selectedMode ==
                                                                          "isNumeric")
                                                                      ? SizedBox(
                                                                          width:
                                                                              400,
                                                                          height:
                                                                              200,
                                                                          child:
                                                                              Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Row(
                                                                                children: [
                                                                                  const Expanded(
                                                                                    flex: 2,
                                                                                    child: Text(
                                                                                      AppConst.enterNumberRange,
                                                                                      style: TextStyle(
                                                                                        fontSize: 16,
                                                                                        fontWeight: FontWeight.bold,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  const SizedBox(
                                                                                    width: 10,
                                                                                  ),
                                                                                  Expanded(
                                                                                    flex: 3,
                                                                                    child: Row(
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: TextField(
                                                                                            controller: controller.startController,
                                                                                            inputFormatters: [
                                                                                              FilteringTextInputFormatter.allow(RegExp(r'^(\d{0,3}(\.\d{0,3})?)$')),
                                                                                            ],
                                                                                            onChanged: (value) {
                                                                                              controller.updateNumber();
                                                                                            },
                                                                                            decoration: const InputDecoration(
                                                                                              hintText: "Start",
                                                                                              border: OutlineInputBorder(),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        const SizedBox(width: 8),
                                                                                        Expanded(
                                                                                          child: TextField(
                                                                                            controller: controller.endController,
                                                                                            inputFormatters: [
                                                                                              FilteringTextInputFormatter.allow(RegExp(r'^(\d{0,3}(\.\d{0,3})?)$')),
                                                                                            ],
                                                                                            onChanged: (value) {
                                                                                              controller.updateNumber();
                                                                                            },
                                                                                            decoration: const InputDecoration(
                                                                                              hintText: "End",
                                                                                              border: OutlineInputBorder(),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 15,
                                                                              ),
                                                                              Row(
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  const Expanded(
                                                                                    flex: 2,
                                                                                    child: Text(
                                                                                      AppConst.enterNumberLimit,
                                                                                      style: TextStyle(
                                                                                        fontSize: 16,
                                                                                        fontWeight: FontWeight.bold,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  const SizedBox(width: 10),
                                                                                  Expanded(
                                                                                    flex: 3,
                                                                                    child: TextField(
                                                                                      controller: controller.maxController,
                                                                                      inputFormatters: [
                                                                                        FilteringTextInputFormatter.digitsOnly,
                                                                                        FilteringTextInputFormatter(RegExp(r'^([1-4]?\d|50)$'), allow: true),
                                                                                      ],
                                                                                      onChanged: (value) {
                                                                                        controller.updateNumber();
                                                                                      },
                                                                                      decoration: const InputDecoration(
                                                                                        hintText: AppConst.enterNumberLimitMax,
                                                                                        border: OutlineInputBorder(),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 15,
                                                                              ),
                                                                              Row(
                                                                                children: [
                                                                                  const Expanded(
                                                                                    flex: 2,
                                                                                    child: Text(
                                                                                      AppConst.enterNumberPattern,
                                                                                      style: TextStyle(
                                                                                        fontSize: 16,
                                                                                        fontWeight: FontWeight.bold,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  const SizedBox(width: 10),
                                                                                  Expanded(
                                                                                    flex: 3,
                                                                                    child: TextField(
                                                                                      controller: controller.patternController,
                                                                                      onChanged: (value) {
                                                                                        controller.updateNumber();
                                                                                      },
                                                                                      decoration: const InputDecoration(
                                                                                        hintText: AppConst.enterPattern,
                                                                                        border: OutlineInputBorder(),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              )
                                                                            ],
                                                                          ),
                                                                        )
                                                                      : Container(
                                                                          height:
                                                                              0.001),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      })
                                                    : Container(height: 0.001),

                                                /// __________________________________________>>>>
                                                ((controller.selectedMode.value.compareTo("isOptions") == 0 ||
                                                            controller.selectedMode.value.compareTo("isMultiOptions") ==0) &&
                                                        (controller.options.length > 1))
                                                    ? ChipsChoice<String>.single(
                                                        choiceItems:
                                                            C2Choice.listFrom<
                                                                String, String>(
                                                          source: controller
                                                              .options.value,
                                                          value: (i, v) => v,
                                                          label: (i, v) => v,
                                                          tooltip: (i, v) => v,
                                                        ),
                                                        choiceCheckmark: false,
                                                        choiceStyle:
                                                            C2ChipStyle.filled(
                                                          overlayColor: AppColor
                                                              .primaryColor,
                                                          foregroundStyle:
                                                              const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700),
                                                          height:
                                                              ScreenSize.height(
                                                                      context) *
                                                                  0.04,
                                                          color: AppColor
                                                              .greyShimmer,
                                                        ),
                                                        leading: IconButton(
                                                          tooltip:
                                                              'Edit Choice',
                                                          icon: const Icon(Icons
                                                              .edit_note_rounded),
                                                          onPressed: () async {
                                                            controller
                                                                .refreshTextController(
                                                                    controller
                                                                        .options
                                                                        .value);
                                                            controller
                                                                .updateIsExtented(
                                                                    isExtented:
                                                                        true, isOptionsDialog: true);
                                                          },
                                                        ),
                                                        value: '',
                                                        onChanged:
                                                            (String value) {},
                                                      )
                                                    : Container(height: 0.001),


                                                Row(
                                                  children: [
                                                    /// IS MANDATORY CHECKBOX
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(8.0),
                                                      child: Row(
                                                        children: [
                                                          const Text(
                                                            AppConst.isMandatory,
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                            ),
                                                          ),
                                                          Checkbox(
                                                            checkColor:
                                                                AppColor.black,
                                                            // focusColor: AppColor.primaryColor,
                                                            activeColor: AppColor
                                                                .primaryColor,
                                                            value: controller
                                                                .isMandatory.value,
                                                            onChanged:
                                                                (bool? value) {
                                                              controller.isMandatory
                                                                      .value =
                                                                  value ?? false;
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),

                                                    /// IS FOLLOW UP
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets.all(8.0),
                                                      child: Row(
                                                        children: [
                                                          const Text(
                                                            AppConst.isFollowUp,
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                              FontWeight.bold,
                                                            ),
                                                          ),
                                                          Checkbox(
                                                            checkColor:
                                                            AppColor.black,
                                                            // focusColor: AppColor.primaryColor,
                                                            activeColor: AppColor
                                                                .primaryColor,
                                                            value: controller
                                                                .isFollowUp.value,
                                                            onChanged:
                                                                (bool? value) {
                                                              controller.updateIsFollowUp(value ?? false);
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),

                                                    /// IS PREGNANT
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets.all(8.0),
                                                      child: Row(
                                                        children: [
                                                          const Text(
                                                            AppConst.isPregnant,
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                              FontWeight.bold,
                                                            ),
                                                          ),
                                                          Checkbox(
                                                            checkColor:
                                                            AppColor.black,
                                                            focusColor: AppColor.primaryColor,
                                                            activeColor: AppColor.primaryColor,
                                                            value: controller.isPregnancy.value,
                                                            onChanged: (bool? value) {
                                                              controller.updateIsPregnancy(value ?? false);
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )),
                                    ],
                                  ),
                                ),
                              )),

                          ///FOOTER
                          Expanded(
                            flex: 13,
                            child:

                                /// BUTTONS CREATE AND CANCEL
                                Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                    width: ScreenSize.width(context) * 0.5,
                                    child: const Divider(
                                      color: AppColor.primaryColor,
                                    )),
                                Obx(
                                  () => Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: AutoSizeText(
                                      controller.errorMessage.value,
                                      style:
                                          AppThemes.textErrorMessageFontTheme,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: ScreenSize.width(context) * 0.5,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        width: ScreenSize.width(context) * 0.1,
                                        child: AppButton(
                                          height:
                                              ScreenSize.height(context) * 0.05,
                                          buttonText: AppConst.cancel,
                                          buttonColor: AppColor.tertiaryColor,
                                          onTap: () {
                                            Get.back();
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        width: ScreenSize.width(context) * 0.1,
                                        child: AppButton(
                                          height:
                                              ScreenSize.height(context) * 0.05,
                                          buttonText:
                                              controller.isNewElement.value
                                                  ? AppConst.create
                                                  : AppConst.update,
                                          onTap: () {
                                            controller.updateAndCreateButton();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ));
  }

  ///DIALOG BOX FOR CONFORMATION WHILE REMOVING AGE GROUP
  Future<bool?> showConfirmationDialog(BuildContext context) async {
    return await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Removal'),
        content: const Text('Are you sure you want to remove this item?'),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context, false),
          ),
          TextButton(
            child: const Text('OK'),
            onPressed: () => Navigator.pop(context, true),
          ),
        ],
      ),
    );
  }
}
