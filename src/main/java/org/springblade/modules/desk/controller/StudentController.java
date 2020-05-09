/**
 * Copyright (c) 2018-2028, Chill Zhuang 庄骞 (smallchill@163.com).
 * <p>
 * Licensed under the GNU LESSER GENERAL PUBLIC LICENSE 3.0;
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * <p>
 * http://www.gnu.org/licenses/lgpl.html
 * <p>
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.springblade.modules.desk.controller;

import io.swagger.annotations.Api;

import com.github.xiaoymin.knife4j.annotations.ApiOperationSupport;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.AllArgsConstructor;
import javax.validation.Valid;

import org.springblade.core.mp.support.Condition;
import org.springblade.core.mp.support.Query;
import org.springblade.core.tool.api.R;
import org.springblade.core.tool.utils.Func;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RequestParam;
import com.baomidou.mybatisplus.core.metadata.IPage;
import org.springblade.modules.desk.entity.Student;
import org.springblade.modules.desk.vo.StudentVO;
import org.springblade.modules.desk.wrapper.StudentWrapper;
import org.springblade.modules.desk.service.IStudentService;
import org.springblade.core.boot.ctrl.BladeController;

/**
 * 学生表 控制器
 *
 * @author Blade
 * @since 2020-04-30
 */
@RestController
@AllArgsConstructor
@RequestMapping("blade-desk/student")
@Api(value = "学生表", tags = "学生表接口")
public class StudentController extends BladeController {

	private IStudentService studentService;

	/**
	 * 详情
	 */
	@GetMapping("/detail")
	@ApiOperationSupport(order = 1)
	@ApiOperation(value = "详情", notes = "传入student")
	public R<StudentVO> detail(Student student) {
		Student detail = studentService.getOne(Condition.getQueryWrapper(student));
		return R.data(StudentWrapper.build().entityVO(detail));
	}

	/**
	 * 分页 学生表
	 */
	@GetMapping("/list")
	@ApiOperationSupport(order = 2)
	@ApiOperation(value = "分页", notes = "传入student")
	public R<IPage<StudentVO>> list(Student student, Query query) {
		IPage<Student> pages = studentService.page(Condition.getPage(query), Condition.getQueryWrapper(student));
		return R.data(StudentWrapper.build().pageVO(pages));
	}


	/**
	 * 自定义分页 学生表
	 */
	@GetMapping("/page")
	@ApiOperationSupport(order = 3)
	@ApiOperation(value = "分页", notes = "传入student")
	public R<IPage<StudentVO>> page(StudentVO student, Query query) {
		IPage<StudentVO> pages = studentService.selectStudentPage(Condition.getPage(query), student);
		return R.data(pages);
	}

	/**
	 * 新增 学生表
	 */
	@PostMapping("/save")
	@ApiOperationSupport(order = 4)
	@ApiOperation(value = "新增", notes = "传入student")
	public R save(@Valid @RequestBody Student student) {
		return R.status(studentService.save(student));
	}

	/**
	 * 修改 学生表
	 */
	@PostMapping("/update")
	@ApiOperationSupport(order = 5)
	@ApiOperation(value = "修改", notes = "传入student")
	public R update(@Valid @RequestBody Student student) {
		return R.status(studentService.updateById(student));
	}

	/**
	 * 新增或修改 学生表
	 */
	@PostMapping("/submit")
	@ApiOperationSupport(order = 6)
	@ApiOperation(value = "新增或修改", notes = "传入student")
	public R submit(@Valid @RequestBody Student student) {
		return R.status(studentService.saveOrUpdate(student));
	}

	
	/**
	 * 删除 学生表
	 */
	@PostMapping("/remove")
	@ApiOperationSupport(order = 7)
	@ApiOperation(value = "逻辑删除", notes = "传入ids")
	public R remove(@ApiParam(value = "主键集合", required = true) @RequestParam String ids) {
		return R.status(studentService.deleteLogic(Func.toLongList(ids)));
	}

	
}
