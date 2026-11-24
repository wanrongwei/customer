package com.asiainfo.crm.cm.vo;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class TreeNodeVO {
    private String treeNodeId;
    private String parentNodeId;
    private int level = -1;
    private boolean isLeaf = false;
    private boolean isChecked = false;
    private boolean isLastNode = false;
    private String value;
    private String label;
    private String userObj;
    private List<TreeNodeVO> childrenNode = new ArrayList<TreeNodeVO>();
    private String foldOpenPicUrl;
    private String foldClosePicUrl;
    private String leafPicUrl;

    public void addChild(TreeNodeVO treeNode) throws Exception {
        treeNode.setParentNodeId(this.getTreeNodeId());
        this.childrenNode.add(treeNode);
    }
}
